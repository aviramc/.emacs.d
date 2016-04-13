"""
Oren Zomer's prettify - make long string appear "pretty"
"""

from Pymacs import lisp
import re
import os
from functools import wraps

interactions = {}

def interact(foo):
    interactions[foo] = ''
    return foo

def on_region_or_line(func):
    @wraps(func)
    def wrapper():
        if lisp.mark_active.value():
            # fetch marked text
            start = lisp.point()
            end = lisp.mark(True)
        else:
            # fetch full line
            start = lisp.line_beginning_position()
            end = lisp.line_end_position()

        start, end = min(start, end), max(start, end)
            
        text = lisp.buffer_substring(start, end)
        new_text = func(text)
        if isinstance(new_text, str):
            # replace text with new text
            lisp.delete_region(start, end)
            lisp.insert(new_text)
    return wrapper

MIN_NEW_LINE_LENGTH = 7
_prettify_special_char_re = re.compile(r"""([\s\\\"\'\,\(\)\[\]\{\}])""")

@interact
@on_region_or_line
def prettify(string):
    string = str(string)
    indent_stack = [' ' * (len(string) - len(string.lstrip()))]
    total_seq = indent_stack[:] # copy
    last_line_length = len(total_seq[0])
    string_open_token = None    
    
    inner_seq = ['']
    for token in _prettify_special_char_re.split(string.lstrip()):
        if string_open_token is None:
            if token in ('\n', ' '):
                continue
        
        if inner_seq is not None:
            inner_seq[-1] += token
        else:
            total_seq.append(token)

        if string_open_token is not None:
            if string_open_token == token:
                string_open_token = None
            continue

        if token in ('(', '[', '{'):
            if inner_seq is not None:
                joined_inner_seq = ('\n' + indent_stack[-1]).join(inner_seq)
                total_seq.append(joined_inner_seq)
                if '\n' in joined_inner_seq:
                    last_line_length = len(joined_inner_seq) - joined_inner_seq.rfind('\n') - 1
                else:
                    last_line_length += len(joined_inner_seq)
            inner_seq = ['']
            indent_stack.append(' ' * last_line_length)
        elif token in (')', ']', '}'):
            if inner_seq is not None:
                if any(len(part.strip()) > MIN_NEW_LINE_LENGTH for part in inner_seq):
                    # ends as multiline
                    joined_inner_seq = ('\n' + indent_stack[-1]).join(inner_seq)
                else:
                    # ends as uniline
                    joined_inner_seq = ' '.join(inner_seq)
                total_seq.append(joined_inner_seq)
                if '\n' in joined_inner_seq:
                    last_line_length = len(joined_inner_seq) - joined_inner_seq.rfind('\n') - 1
                else:
                    last_line_length += len(joined_inner_seq)
                inner_seq = None
            if len(indent_stack) > 1:
                indent_stack.pop(-1)
        elif token == ',':
            if inner_seq is None:
                total_seq.append('\n' + indent_stack[-1])
                last_line_length = len(indent_stack[-1])
            else:
                inner_seq.append('')
        elif token in ('"', '\''):
            string_open_token = token
    if inner_seq is not None:
        total_seq.append(' '.join(inner_seq))
    return ''.join(total_seq).rstrip()
