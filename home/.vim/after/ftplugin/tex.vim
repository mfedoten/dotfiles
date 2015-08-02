imap <buffer> [[        \begin{
imap <buffer> ]]        <Plug>LatexCloseCurEnv
nmap <buffer> <F5>      <Plug>LatexToggleStarEnv
nmap <buffer> <F6>      <Plug>LatexChangeEnv
vmap <buffer> <F7>      <Plug>LatexWrapSelection
vmap <buffer> <F8>      <Plug>LatexEnvWrapSelection
imap <buffer> ((        \eqref{
map  <silent> <buffer> ¶ :call LatexBox_JumpToNextBraces(0)<CR>
map  <silent> <buffer> § :call LatexBox_JumpToNextBraces(1)<CR>
imap <silent> <buffer> ¶ <C-R>=LatexBox_JumpToNextBraces(0)<CR>
imap <silent> <buffer> § <C-R>=LatexBox_JumpToNextBraces(1)<CR>
