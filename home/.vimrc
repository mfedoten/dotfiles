" This is vimrc file. Mariia Fedotenkova
" ------------------------------------------------------------------------ {{{
" Some useful tips, more tricks and other info on vim can be found, e.g:
" http://learnvimscriptthehardway.stevelosh.com/
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/
" http://nvie.com/posts/how-i-boosted-my-vim/
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/
" http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
" http://www.viemu.com/a_vi_vim_graphical_cheat_sheet_tutorial.html
" }}}

" Use Vim settings, rather than Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Installed plugins ------------------------------------------------------ {{{
" Install Vungle first:
" $ mkdir ~/.vim/bundle/Vundle.vim
" $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Required by Vundle
filetype off

" let Vundle manage Vundle (required!)
set rtp+=~/.vim/bundle/vundle/

" The bundles you install will be listed here, between begin/end
call vundle#begin()
Plugin 'gmarik/vundle'
Plugin 'ciaranm/securemodelines'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'sjl/gundo.vim'
Plugin 'nvie/vim-togglemouse'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'ervandew/snipmate.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'
Plugin 'davidhalter/jedi-vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'jordwalke/flatlandia'
Plugin 'endel/vim-github-colorscheme'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'antlypls/vim-colors-codeschool'
call vundle#end()

" Enable file type detection - required.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" }}}

" Some small functions --------------------------------------------------- {{{

" Toggle Highlight/Colorbar ---------------------------------------------- {{{
    " Functions which allows to toggle between highlighting excessive
    " characters or placing a color bar. It takes textwidth parameter, if it
    " is set, otherwise set limit to 80.
function! ToggleHighlight()
    if !exists('b:ExcessHighlight')
        setlocal colorcolumn=0
        highlight Excess ctermbg=DarkGrey guibg=Black
        if &tw > 0
            let b:ExcessHighlight = matchadd('Excess', '\%>'.&tw.'v.\+', -1)
        else
            let b:ExcessHighlight = matchadd('Excess', '\%>80v.\+', -1)
        endif
    else
        call matchdelete(b:ExcessHighlight)
        unlet b:ExcessHighlight
    endif
endfunction

function! ToggleBar()
    if &colorcolumn=="0" || empty(&colorcolumn)
        "highlight ColorColumn ctermbg=DarkGrey guibg=Black
        if exists('b:ExcessHighlight')
            call ToggleHighlight()
        endif
        if &tw > 0
            setlocal colorcolumn=+1
        else
            setlocal colorcolumn=80
        endif
    else
        setlocal colorcolumn=0
    endif
endfunction

augroup CheckForHilight
    autocmd!
    autocmd BufWinLeave * let b:m=getmatches() | call clearmatches()
    autocmd BufWinEnter * if exists('b:ExcessHighlight')&&exists('b:m') | call setmatches(b:m) | endif
augroup END
" }}}

" Toggle Background/Colorscheme ------------------------------------------ {{{
    " Toggle between dark/light background colorschemes are different for gui
    " and terminal
function! ToggleColors()
    if &background=="dark"
        set background=light
        if has("gui_running")
            colorscheme github
            let g:airline_theme='papercolor'
            AirlineRefresh
            AirlineRefresh
        endif
    else
        set background=dark
        if has("gui_running")
            colorscheme flatlandia
            let g:airline_theme='flatlandia'
            AirlineRefresh
            AirlineRefresh
        endif
    endif
endfunction
" }}}

" DiffOrig --------------------------------------------------------------- {{{
    " Convenient command to see the difference between the current buffer and
    " the file it was loaded from, thus the changes you made.  Only define it
    " when not defined already.
    " http://stackoverflow.com/questions/6426154/
if !exists(":DiffOrig")
    command DiffOrig let g:diffline = line('.') | vert new | set bt=nofile
                \ | r # | 0d_ | diffthis | :exe "norm! ".g:diffline."G"
                \ | wincmd p | diffthis | wincmd p
endif
" Map a function to show/hide changes in the current file
function! ToggleDiffOrig()
    if !exists('g:diffline')
        DiffOrig
    else
        exe "q | diffoff | norm! ".g:diffline."G"
        unlet g:diffline
    endif
endfunction
" }}}

" Rename current file, thanks to Gary Bernhardt via Ben Orenstein -------- {{{
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
" }}}

" }}}

" First, set the leader keys
let mapleader = "\<Space>"
let maplocalleader = "\\"

" Basic settings --------------------------------------------------------- {{{
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ttyfast             " For better display
set title               " Show name of the current document in terminal tabs
set number              " Show line number
set ruler               " Show the cursor position all the time
set showmatch           " Set show matching parenthesis
set tabstop=4           " Set Tab to 4 spaces
set shiftwidth=4        " CTRL-T and CTRL-D use 4 spaces
set expandtab           " always expand tabs to spaces
set encoding=utf-8      " UTF-8
set linebreak           " Break long lines only at specific symbols
set showcmd             " Display incomplete commands
set history=500         " Keep 500 lines of command line history
set undofile            " Undo even after closing and re-openninf a file
set autoread            " Automatically re-read the file if it has changed
set incsearch           " Do incremental searching
set ignorecase          " To make smart case work
set smartcase           " Ignore case if search pattern is all lowercase,
                        "    case-sensitive otherwise

" Don't show invisibles, switch it on when needed
set nolist
set listchars=tab:>.,trail:·,nbsp:·,eol:¶

" Backup files
set backup
set noswapfile

" Use directories for backup files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" Creeate directories if don't exist already
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif

" allows using bash aliases
let $BASH_ENV = "~/.bash/03_aliases.bash"

" }}}

" Syntax and code completion --------------------------------------------- {{{
set omnifunc=syntaxcomplete#Complete

" Plugins for code completion -------------------------------------------- {{{

" SuperTab: allows completion with Tab ----------------------------------- {{{
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText','s:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
let g:SuperTabMappingBackward = "<c-tab>"
let g:SuperTabMappingTabLiteral = "<s-tab>"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 0
augroup compl
    au!
    autocmd FileType *
        \ if &omnifunc != '' |
        \   call SuperTabChain(&omnifunc, "<c-p>") |
        \ endif
augroup END
" }}}

" YouCompleteMe: code-completion engine----------------------------------- {{{
" " Switch on pop-up menu by default
" let g:ycm_auto_trigger = 1
" " Switch off completion in comments
" let g:ycm_complete_in_comments = 0
" " Don't use Tab for navigation in pop-up menu
" let g:ycm_key_list_select_completion = ['<Down>','<C-n>']
" let g:ycm_key_list_previous_completion = ['<Up>','<C-p>']
" " Don't use completion provided by YCM
" let g:ycm_filetype_specific_completion_to_disable = {'*' : 1}
" " Don't use diagnostics form YCM
" let g:ycm_show_diagnostics_ui = 0
" " Add language keywords to YCM database
" let g:ycm_seed_identifiers_with_syntax = 1
" " Add words you typed in comments to completion
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" " Start semantic completion after "{" in latex documents
" let g:ycm_semantic_triggers = {
            " \  'tex'  : ['{'],
            " \ }
" }}}

" Clang_complete: C code-completion using clang -------------------------- {{{
let g:clang_close_preview = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1
let g:clang_auto_select = 1
let g:clang_library_path = "/Library/Developer/CommandLineTools/usr/lib/"
let g:clang_user_options='|| exit 0'
" }}}

" Jedi-Vim: code-completion for python ----------------------------------- {{{
    " Cheat sheet ------------------------------------------------------- {{{
    " - Completion <C-Space>
    " - Goto assignments <localleader>g (typical goto function)
    " - Goto definitions <localleader>d (follow identifier as far as possible, includes
    " imports and statements)
    " - Show Documentation/Pydoc K (shows a popup with assignments)
    " - Renaming <localleader>r
    " - Usages <localleader>N (shows all the usages of a name)
    " Open module, e.g. :Pyimport os (opens the os module) }}}

let g:jedi#completions_command = "<C-Space>"
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_splits_not_buffers = "right"
let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<localleader>g"
let g:jedi#goto_assignments_command = "<localleader>ga"
let g:jedi#goto_definitions_command = "<localleader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<localleader>N"
let g:jedi#rename_command = "<localleader>r"
"}}}

" Vim-Flake8: checks python syntax --------------------------------------- {{{
    " Called by <F7>. Requires $ pip install flake8
    " To avoid certain

" let g:flake8_quickfix_height=5  " Set nr. of warnings displayed in quickfix
" let g:flake8_show_in_gutter=1   " Show markers in gutter
" let g:flake8_show_quickfix=0    " Open quikfix window
" " Toggle the "gutter"
" nnoremap <leader>G :call flake8#Flake8UnplaceMarkers()<cr>
" " to use colors defined in the colorscheme
" highlight link Flake8_Error Special
" highlight link Flake8_Warning Type
" highlight link Flake8_Complexity Type
" highlight link Flake8_Nameing Type
" highlight link Flake8_PyFlake Type
" }}}

" Syntastic: syntax check -------- --------------------------------------- {{{
    " Called by <F7>. To enable check in python:
    " $ pip install flake8
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'W>'
let g:syntastic_loc_list_height = 5
" let g:syntastic_ignore_files = ['\m\c\.py$']
let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_python_checkers = ['flake8']
nnoremap <F7> :SyntasticCheck<cr>
nnoremap <leader>G :SyntasticToggleMode<cr>
nnoremap <localleader>l :Errors<cr>
" }}}

" LaTeX-Box: Plugin for easier LaTeX compilation ------------------------- {{{
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2
let g:LatexBox_viewer = 'open -a Skim.app'
let g:LatexBox_split_length = 10
let g:LatexBox_Folding = 1
let g:LatexBox_fold_text = 1
let g:LatexBox_fold_automatic = 0
" let g:LatexBox_ignore_warnings
        " \ = ['Underfull', 'Overfull', 'specifier changed to']
let g:LatexBox_ignore_warnings = ['']
" }}}

" SnipMate: code snippts ------------------------------------------------- {{{
let g:snips_author='Mariia Fedotenkova'
" }}}

" }}}

" Don't open preview window
" set completeopt-=preview
set completeopt=menuone,longest

" }}}

" File navigation -------------------------------------------------------- {{{
" Enhanced command-line completion
set wildmenu
" Ignore list
set wildignore+=*.so,*.swp,*.pyc,*.o,*.obj
set wildignore+=*.png,*.pdf,*.jpg,*.jpeg,*.bmp,*.gif
set wildignore+=*.dmg,*.zip
set wildignore+=*.egg,*.egg-info,*/.Trash/**
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.DS_Store,*/tmp/*

" NerdTree setup: display file system tree ------------------------------- {{{
    " Cheat Sheet ------------------------------------------------------- {{{
    " t: Open the selected file in a new tab
    " i: Open the selected file in a horizontal split window
    " s: Open the selected file in a vertical split window
    " I: Toggle hidden files
    " m: Show the NERD Tree menu
    " R: Refresh thez tree, useful if files change outside of Vim
    " ?: Toggle NERD Tree's quick help }}}
noremap <F2> :NERDTreeToggle<CR>
let g:NERDTreeShowHidden=1
let NERDTreeChDirMode = 2
" let NERDTreeIgnore=[ '\.DS_Store' ]
" }}}

" CTRL-P: fast file navigation ------------------------------------------- {{{
    " Cheat sheet -------------------------------------------------------- {{{
    " Press <F5> to purge the cache for the current directory to get new files,
    " remove deleted files and apply new ignore options.
    " Press <c-f> and <c-b> to cycle between modes.
    " Press <c-d> to switch to filename only search instead of full path.
    " Press <c-r> to switch to regexp mode.
    " Use <c-j>, <c-k> or the arrow keys to navigate the result list.
    " Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a
    " new split.
    " Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
    " Use <c-y> to create a new file and its parent directories.
    " Use <c-z> to mark/unmark multiple files and <c-o> to open them. }}}

let g:ctrlp_cmd = 'CtrlPMRU'           " Start search with recently used files
let g:ctrlp_by_filename = 1            " Start search with filenames
let g:ctrlp_working_path_mode = 'c'    " Start search with current directory
let g:ctrlp_show_hidden = 1            " Search hidden files as well
let g:ctrlp_follow_symlinks = 1        " Follow symbolic links
let g:ctrlp_clear_cache_on_exit = 0    " Keep cash from prev. sessions
" }}}

" Rename file from vim
nnoremap <leader>r :call RenameFile()<cr>
" }}}

" Set appearance --------------------------------------------------------- {{{

" Vim-airline ------------------------------------------------------------ {{{
    " Requires power line fonts. How to get it described here:
    " http://stackoverflow.com/a/19137142/4798992
set laststatus=2                                   " Enable powerline
let g:airline#extensions#tabline#enabled=1         " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod=':t'     " Show just the filename
let g:airline#extensions#tabline#buffer_nr_show=1  " Show buffer number
let g:airline_powerline_fonts=1                    " Use fancy fonts
" Define separators
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Change some defaults
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" unicode symbols for airline
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.space = "\ua0"
" Add Textwidth and format options to a status line
function! AirlineInit()
  let g:airline_section_y = airline#section#create_right(['ffenc'])
endfunction
" }}}

" Switch syntax highlighting on, when the terminal has colors.
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax enable
  set hlsearch
endif

" Disserent settings for Terminal and GUI
if !has("gui_running")
    set background=dark
    let g:hybrid_custom_term_colors=1
    let g:hybrid_reduced_contrast=1
    colorscheme hybrid                " Color scheme in terminal
    let g:airline_theme='tomorrow'
else
    colorscheme flatlandia               " Color scheme
    set transparency=0                   " No transparency
    set guicursor+=a:blinkon0            " No blinking cursor
    set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\:h12 " Fonts for powerline
endif

" Toggle light/dark colors
nnoremap <leader>bg :call ToggleColors()<cr>
" Toggle highlighting of excessive characters
nnoremap <leader>th :call ToggleHighlight()<cr>
" Toggle colorcolumn display
nnoremap <leader>tb :call ToggleBar()<cr>
" }}}

" Some useful mappings and functions ------------------------------------- {{{
" Write a file anyway, even if forgot to sudo
cmap w!! w !sudo tee % >/dev/null

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U or CR after inserting a line break.
inoremap <c-u> <c-g>u<c-u>
inoremap <cr> <c-g>u<cr>

" This would reduce the load on the left hand
inoremap jk <esc>
vnoremap jk <esc>
snoremap jk <esc>

" Not sure it's a good idea, but let's try it out
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" More logical behavior of Y
noremap Y y$

" After yanking in visual mode move cursor to the end of yanked text
vnoremap y y`]

" Play macro at reg. q. Just press qq to record it
nnoremap <leader>q @q
" Replay last macro
nnoremap <leader>a @@

" If a string is wrapped these mappings make navigation easier
nnoremap j gj
nnoremap k gk
onoremap j gj
onoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap gj j
nnoremap gk k
onoremap gj j
onoremap gk k
vnoremap gj j
vnoremap gk k

nnoremap 0 g0
nnoremap $ g$
onoremap 0 g0
onoremap $ g$
vnoremap 0 g0
vnoremap $ g$

nnoremap g0 0
nnoremap g$ $
onoremap g0 0
onoremap g$ $
vnoremap g0 0
vnoremap g$ $

" <m-j> and <m-k> to drag lines in any mode
" Thanks to Steve Losh
noremap ∆ :m+<CR>
noremap ˚ :m-2<CR>
inoremap ∆ <Esc>:m+<CR>
inoremap ˚ <Esc>:m-2<CR>
vnoremap ∆ :m'>+<CR>gv
vnoremap ˚ :m-2<CR>gv

" Remove search highlight
nnoremap <silent> <leader>n :noh<cr>
" Toggle numbers
nnoremap <silent> <leader>nn :setlocal number!<cr>
" Toggle paste mode
nnoremap <silent> <leader>p :setlocal paste!<cr>
" Toggle show/hide whitespaces
nnoremap <silent> <leader>L :setlocal list!<cr>
" remove trailing white spaces
nnoremap <leader>W :%s/\s\+$//<CR>
" Show difference between curent file and original state
nnoremap <F10> :call ToggleDiffOrig()<cr>

" Map Ctrl+V to paste in Insert mode
inoremap <c-v> <c-r>"
" Map Ctrl+C to to copy in Visual mode
vnoremap <c-c> "+y

" Search visually selected text
vnoremap // y/<C-R>"<CR>

" Let Enter accept matches
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Map CTRL-X function in insert mode
inoremap <c-k> <c-x><c-k>
inoremap <c-]> <c-x>s
inoremap <c-l> <c-x><c-l>
inoremap <c-f> <c-x><c-f>

" I really miss home/end in insert mode
inoremap <c-a> <Home>
inoremap <c-e> <End>

" ToggleMouse ------------------------------------------------------------ {{{
" After enabling mouse in vim (with set mouse=a) terminal doesn't control it
" anymore.  To fix it has a look at this plugin. Mapped manually to <F9>.
" To fix issues with mouse in Terminal.app see https://bitheap.org/mouseterm/
" }}}

" Gundo: visualize undo tree --------------------------------------------- {{{
nnoremap <F3> :GundoToggle<CR>
let g:gundo_width = 40
let g:gundo_preview_height = 15
" }}}

augroup vimrcEx
    au!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).  Also don't do it when the mark
    " is in the first line, that is the default position when opening a file.
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

    " For all text and python files set 'textwidth' to 80 characters.
    autocmd FileType text,python setlocal textwidth=80

augroup END

" }}}

" Comments, brackets ----------------------------------------------------- {{{

" NERDCommenter: makes commenting easier --------------------------------- {{{
    " http://spf13.com/post/vim-plugins-nerd-commenter
let NERDSpaceDelims=1           " adds extra spaces to comment
let NERDCompactSexyComs=1       " make block comments more compact
" }}}

" <leader>+"/' to comment a word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel

" Operator-pending mappings to delete within [],() etc. from any place in  {{{
" the line and put cursor between them.
" http://learnvimscriptthehardway.stevelosh.com/chapters/15.html
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F{vi{<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F[vi[<cr>
onoremap in< :<c-u>normal! f<vi<<cr>
onoremap il< :<c-u>normal! F<vi<<cr>
onoremap in" :<c-u>normal! f"lvi"<cr>
onoremap il" :<c-u>normal! F"hvi"<cr>
onoremap in' :<c-u>normal! f'lvi'<cr>
onoremap il' :<c-u>normal! F'hvi'<cr>
" }}}

" }}}

" Spelling --------------------------------------------------------------- {{{
" Enable spell check with F4"
nnoremap <F4> :setlocal spell! spelllang=en_gb<CR>
inoremap <F4> <c-o>:setlocal spell! spelllang=en_gb<CR>
set dictionary=/usr/share/dict/words
hi clear SpellBad
hi SpellBad term=standout term=underline ctermfg=1
            \ cterm=underline gui=undercurl guisp=Red
" }}}

" Foldings --------------------------------------------------------------- {{{
set foldlevelstart=0
set foldmethod=marker
set foldmarker={{{,}}}
" Open fold with cursor and center it in the window
nnoremap zv zvzz
" Close all folds except current and center it in the window
nnoremap z, zMzvzz
" Close all folds and center coursor
nnoremap zM zMzz
" Function to change text displayed in folds, much cleaner.
function! MyFoldText() " Author: Steve Losh {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()
" }}}

" Buffers ---------------------------------------------------------------- {{{
set hidden              " Hides buffer instead of closing it
set confirm             " Reminds of unsaved buffers on quit
" Make work with buffers easier
nnoremap <leader>ls :ls<cr>
nnoremap <Tab>      :bn<cr>
nnoremap <S-Tab>    :bp<cr>
nnoremap <leader>d  :bd<cr>
" Search open buffers with CtrlP
nnoremap <leader>ll :CtrlPBuffer<cr>
" }}}

" Splits ----------------------------------------------------------------- {{{
set splitbelow          " Open new split below by default
set splitright          " Open new vertical split on the right by default
" Split the window with shortcuts
nnoremap <leader>vs :vsplit<space>
nnoremap <leader>s  :split<space>
" Make navigation between screens easier
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>h <c-w>h
nnoremap <leader>l <c-w>l
"Two splits scrolling together
nnoremap <leader>sb :set scrollbind!<cr>
" Jump to the next/previous error in quickfix window
nnoremap <leader>ln :lne<cr>
nnoremap <leader>lp :lp<cr>
" }}}

" File type specific options --------------------------------------------- {{{
" C-family
augroup ft_c
    au!
    autocmd FileType c setlocal foldmethod=syntax foldnestmax=2
    autocmd FileType c setlocal formatoptions=croq1j
    autocmd FileType c setlocal comments-=:// comments+=fb://
    autocmd FileType c call ToggleBar()
    autocmd BufWinEnter *.c :lcd %:p:h
    autocmd BufWinLeave *.c :lcd -
augroup END
" Python
augroup ft_py
    au!
    autocmd FileType python setlocal foldmethod=indent foldnestmax=2
    autocmd FileType python setlocal formatoptions=cqj
    autocmd BufWinEnter *.py :lcd %:p:h
    autocmd BufWinLeave *.py :lcd -
    autocmd FileType python call ToggleBar()
augroup END
" Latex
augroup ft_tex
    au!
    autocmd FileType tex setlocal foldmethod=expr
    autocmd BufWinEnter *.tex :lcd %:p:h
    autocmd BufWinLeave *.tex :lcd -
    autocmd BufRead *.tex setlocal ft=tex
    autocmd BufNewFile *.tex setlocal ft=tex
    autocmd FileType tex setlocal dictionary=~/.vim/dictionaries/tex
    autocmd FileType tex setlocal complete+=k
    autocmd FileType tex setlocal spell
augroup END
" MATLAB
augroup ft_mat
    au!
    autocmd FileType matlab setlocal foldmethod=syntax foldnestmax=2
    autocmd BufWinEnter matlab :lcd %:p:h
    autocmd BufWinLeave matlab :lcd -
    autocmd FileType matlab setlocal tw=80
    autocmd FileType matlab setlocal fo=croqj
augroup END
" Markdown
augroup ft_md
    au!
    autocmd FileType markdown setlocal spell
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
augroup END
" }}}

