syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?"""+ end=+"""+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError
syn region pythonDocstring  start=+^\s*[uU]\?[rR]\?'''+ end=+'''+ keepend excludenl contains=pythonEscape,@Spell,pythonDoctest,pythonDocTest2,pythonSpaceError

syn match MyPyTodo contained "\v<(FIXME|NOTE|TODO|OPTIMIZE|XXX|todo|Todo)" containedin=pythonComment

hi def link pythonDocstring Comment
hi def link MyPyTodo pythonTodo
