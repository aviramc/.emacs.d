"""
my addons

author: Oren Zomer
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
            

def split_filepaths(line):
    return re.split(r"(?<!\\)\s", line)

def fetch_filepath(line, offset):
    offset = sum(len(part) for part in split_filepaths(line[:offset+1]))
    length = 0
    for filepath in split_filepaths(line):
        length += len(filepath)
        if offset <= length:
            break
    return filepath

@interact
@on_region_or_line
def find_pointed_file(text):
    filepath = fetch_filepath(text).strip('"').strip('\'')

    if (os.path.sep not in filepath) and (lisp.mode_name.value() == 'Python'):
        filepath = filepath.replace('.', os.path.sep)

    lineno = None
    filepath_lineno = re.match(r"(.*)(?<!\\)\:(\d+)", filepath)
    if filepath_lineno:
        filepath, lineno = filepath_lineno.groups()

    cwd = os.getcwd()
    for search_path in [os.path.curdir] + \
        os.getenv('PATH', '').split(os.path.pathsep) + \
        os.getenv('PYTHONPATH', '').split(os.path.pathsep) + \
        [os.path.join(cwd, *([os.path.pardir] * (1 + parent_no))) for parent_no in xrange(cwd.count(os.path.sep))]:
        if os.path.exists(os.path.join(search_path, filepath)):
            break
    else:
        lisp.error("failed to find %s" % (filepath,))
        return

    lisp.find_file(os.path.join(search_path, filepath))
    if lineno is not None:
        lisp.goto_line(int(lineno))


@interact
def switch_to_other_buffer():
    lisp.switch_to_buffer(lisp.other_buffer())

#  ____           _   _   _  __       
# |  _ \ _ __ ___| |_| |_(_)/ _|_   _ 
# | |_) | '__/ _ \ __| __| | |_| | | |
# |  __/| | |  __/ |_| |_| |  _| |_| |
# |_|   |_|  \___|\__|\__|_|_|  \__, |
#                               |___/ 

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
        
#  ____                              ____            _             _   ____  _        _             
# / ___|  ___  _   _ _ __ ___ ___   / ___|___  _ __ | |_ _ __ ___ | | / ___|| |_ __ _| |_ _   _ ___ 
# \___ \ / _ \| | | | '__/ __/ _ \ | |   / _ \| '_ \| __| '__/ _ \| | \___ \| __/ _` | __| | | / __|
#  ___) | (_) | |_| | | | (_|  __/ | |__| (_) | | | | |_| | | (_) | |  ___) | || (_| | |_| |_| \__ \
# |____/ \___/ \__,_|_|  \___\___|  \____\___/|_| |_|\__|_|  \___/|_| |____/ \__\__,_|\__|\__,_|___/
#   __   ____ _ _        __  _   _        __  
#  / /  / ___(_) |_     / / | | | | __ _  \ \ 
# | |  | |  _| | __|   / /  | |_| |/ _` |  | |
# | |  | |_| | | |_   / /   |  _  | (_| |  | |
# | |   \____|_|\__| /_/    |_| |_|\__, |  | |
#  \_\                             |___/  /_/ 

@interact
def source_control_status():
    """
    Run relevant source control status command
    """    
    current_dir = lisp.default_directory.value()
    if not isinstance(current_dir, str):
        lisp.error("failed to fetch current directory")
        return
    for _ in xrange(30):
        if os.path.exists(os.path.join(current_dir, '.hg')):
            lisp.ahg_status()
            break
        if os.path.exists(os.path.join(current_dir, '.git')):
            lisp.git_status(current_dir)
            break
        current_dir = os.path.dirname(current_dir)
        if current_dir in ('', '/'):
            lisp.error('reached top directory without find hg/git project directory')
    else:
        lisp.error('failed to find hg/git project directory after many attempts')
