" Check if NERDTree is open or active
function! NerdFindToggle()        
    if  exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
      :NERDTreeClose
    else
      " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
      " file, and we're not in vimdiff
      if &modifiable && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
      endif
    endif
endfunction

noremap <F2> :call NerdFindToggle()<CR>
let g:NERDTreeShowHidden = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeRespectWildIgnore = 1
" let NERDTreeIgnore=[ '\.DS_Store' ]
