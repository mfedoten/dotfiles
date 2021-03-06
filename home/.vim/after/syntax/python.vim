syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError

syn match MyPyTodo contained "\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|todo|Todo)" containedin=pythonComment,pythonDocstring

hi def link pythonDocstring pythonComment
hi def link MyPyTodo pythonTodo
