" This is vimrc file. Mariia Fedotenkova
" ---------------------------------------------------------------------------------------------- {{{
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

" Installed plugins ---------------------------------------------------------------------------- {{{
" The plugins you install will be listed here, between begin/end
call plug#begin()
Plug 'ciaranm/securemodelines'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sjl/gundo.vim'
Plug 'nvie/vim-togglemouse'
Plug 'qpkorr/vim-bufkill'
Plug 'dr-chip-vim-scripts/ZoomWin'
Plug 'scrooloose/nerdcommenter'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Chiel92/vim-autoformat'
Plug 'scrooloose/syntastic'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'Rip-Rip/clang_complete'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'tmhedberg/SimpylFold'
Plug 'nelstrom/vim-markdown-folding'
Plug 'wellle/targets.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'vim-python/python-syntax'
Plug 'endel/vim-github-colorscheme'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'mfedoten/vimberry'
Plug 'jacoborus/tender.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'cocopon/iceberg.vim'
Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'lervag/vimtex'
" Plug 'chrisbra/Colorizer'
call plug#end()

" Enable file type detection - required.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" }}}

" Some small functions ------------------------------------------------------------------------- {{{

" Toggle Highlight/Colorbar -------------------------------------------------------------------- {{{
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

" DiffOrig ------------------------------------------------------------------------------------- {{{
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

" Rename current file, thanks to Gary Bernhardt via Ben Orenstein ------------------------------ {{{
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

" Basic settings ------------------------------------------------------------------------------- {{{
" Allow backspacing over everything in insert mode
set backspace=indent,eol,start
set ttyfast             " For better display
set title               " Show name of the current document in terminal tabs
set number              " Show line number
set rnu                 " Relative line numbering
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
set scrolloff=999       " Keep cursor centred vertically on the screen
set iskeyword-=_        " To consider '_' as word break
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
" let $BASH_ENV = "$HOME/.bash/aliases.bash:$HOME/.bash/aliases_local.bash:$BASH_ENV"

" File options (cursor position, format options, cwd) ------------------------------------------ {{{
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

    if v:version >= 700
      au BufLeave * if !&diff | let b:winview = winsaveview() | endif
      au BufEnter * if exists('b:winview') && !&diff | call winrestview(b:winview) | unlet! b:winview | endif
    endif

    " change CWD to the file's directory
    set autochdir

    " For all text and python files set 'textwidth' to 80 characters.
    autocmd FileType text,python,vim setlocal textwidth=100
    autocmd FileType tex,markdown setlocal spell
    autocmd BufNewFile,BufRead * call ToggleBar()
augroup END
"}}}

" }}}

" Some useful mappings and functions ----------------------------------------------------------- {{{
" Print file's full path
command PWD echo expand('%:p')
" Write a file anyway, even if forgot to sudo
cmap w!! w !sudo tee % >/dev/null
" Execute selection in vim command line
vnoremap <silent> <leader>X "xy:@x<cr>
" Format Windows files to human format
command Win %s//\r/g
" Format ugly json
command Json %!python -m json.tool
command Xml %s/></>\r</g | normal gg=G

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U or CR after inserting a line break.
inoremap <c-u> <c-g>u<c-u>
inoremap <cr> <c-g>u<cr>

" This would reduce the load on the left hand
inoremap jk <esc>
vnoremap jk <esc>
snoremap jk <esc>
cnoremap jk <esc>

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

" easier jumps to beginning/end of line
noremap H g^
noremap L g$
vnoremap L g_

" remap <c-i> (go to newer position in jump list) to <c-n> (anyway, it's
" duplicated by j)
nnoremap <c-n> <c-i>

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
nnoremap <F5> :call ToggleDiffOrig()<cr>

" Map Ctrl+V to paste in Insert mode
inoremap <c-v> <c-r>"
" Map Ctrl+C to to copy in Visual mode
vnoremap <c-c> "+y

" Search visually selected text
vnoremap // y/<C-R>"<CR>

" Formatting with Q (remember cursor position in normal mode)
nnoremap Q mlgqip`l
vnoremap Q gq
nnoremap ql gqq

" Some abbreviations for common typos
iabbrev wiht with
iabbrev teh the
iabbrev adn and


" ToggleMouse ---------------------------------------------------------------------------------- {{{
" After enabling mouse in vim (with set mouse=a) terminal doesn't control it
" anymore.  To fix it has a look at this plugin. Mapped manually to <F9>.
" To fix issues with mouse in Terminal.app see https://bitheap.org/mouseterm/
" }}}

" Gundo: visualize undo tree ------------------------------------------------------------------- {{{
nnoremap <F3> :GundoToggle<CR>
let g:gundo_prefer_python3 = 1
let g:gundo_width = 40
let g:gundo_preview_height = 15
" }}}

" ReplaceWithRegister: don't overwrite a register when replacing text -------------------------- {{{
    " Cheat sheet ------------------------------------------------------------------------------ {{{
    " ["x]gr{motion}  Replace {motion} text with the contents of register x.
    " ["x]gR          Replace lines with the contents of register x.
    " ["x]gr$         Replace from the cursor position to the end of the line.
    " {Visual}["x]gr  Replace the selection with the contents of register x
    " }}}
" xnoremap p <Plug>ReplaceWithRegisterVisual
" }}}

" }}}

" Files navigation ----------------------------------------------------------------------------- {{{
" Enhanced command-line completion
set wildmenu
set wildignorecase
" Ignore list
set wildignore+=*.so,*.swp,*.pyc,*.o,*.obj
set wildignore+=*.png,*.pdf,*.jpg,*.jpeg,*.bmp,*.gif
set wildignore+=*.dmg,*.zip
set wildignore+=*.egg,*.egg-info,*/.Trash/**
set wildignore+=.hg,.git,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.DS_Store,*/tmp/*

" Ctags (see ~/.git_template)
set tags+=.git/tags

" Rename file from vim
nnoremap <leader>R :call RenameFile()<cr>

" Vim-Rooter: change cwd to the project root --------------------------------------------------- {{{
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 0
let g:rooter_manual_only = 1
" let g:rooter_resolve_links = 1
" }}}

" NerdTree setup: display file system tree ----------------------------------------------------- {{{
    " Cheat Sheet ------------------------------------------------------------------------------ {{{
    " t: Open the selected file in a new tab
    " i: Open the selected file in a horizontal split window
    " s: Open the selected file in a vertical split window
    " I: Toggle hidden files
    " m: Show the NERD Tree menu
    " R: Refresh thez tree, useful if files change outside of Vim
    " ?: Toggle NERD Tree's quick help }}}
" The mappings and settings are in ~/.vim/after/plugin/nerdtree.vim
" }}}

" CTRL-P: fast file navigation ----------------------------------------------------------------- {{{
    " Cheat sheet ------------------------------------------------------------------------------ {{{
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
let g:ctrlp_by_filename = 0            " Start search with filenames
let g:ctrlp_working_path_mode = 'rwa'   " Start search with current directory
let g:ctrlp_show_hidden = 1            " Search hidden files as well
let g:ctrlp_follow_symlinks = 1        " Follow symbolic links
let g:ctrlp_clear_cache_on_exit = 0    " Keep cash from prev. sessions
let g:ctrlp_extensions = ['rtscript', 'tag', 'buffertag']
let g:ctrlp_custom_ignore = '.vim/undo\|.vim/backup'
let g:ctrlp_prompt_mappings = {'ToggleType(1)': ['<c-g>', '<c-up>']} " <c-f> is my tmux prefix
nnoremap <leader>F :CtrlP<cr>
nnoremap <leader>T :CtrlPTag<cr>
nnoremap <leader>tt :CtrlPBufTag<cr>
" }}}

" }}}

" Buffers -------------------------------------------------------------------------------------- {{{
set hidden              " Hides buffer instead of closing it
set confirm             " Reminds of unsaved buffers on quit
" Make work with buffers easier
nnoremap <leader>ls :ls!<cr>
nnoremap <silent> <Tab>      :bn<cr>
nnoremap <silent> <S-Tab>    :bp<cr>
" Mapping for buffkill
nnoremap <leader>d  :BD<cr>
nnoremap <leader>ba :BA<cr>
" Search open buffers with CtrlP
nnoremap <leader>ll :CtrlPBuffer<cr>
" }}}

" Splits --------------------------------------------------------------------------------------- {{{
set splitbelow          " Open new split below by default
set splitright          " Open new vertical split on the right by default
" Split the window with shortcuts
nnoremap <leader>v :vsplit<space>
nnoremap <leader>s :split<space>
" Make navigation between screens easier
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
"Two splits scrolling together
" nnoremap <leader>sb :set scrollbind!<cr>
" }}}

" Fugitive ------------------------------------------------------------------------------------- {{{
nnoremap <leader>gd :Gdiff<space>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit<cr>
nnoremap <leader>gm :Gmove<cr>
nnoremap <leader>gr :Gremove<cr>
nnoremap <leader>gl :Gitv<cr>
" diff in vertical splits
set diffopt+=vertical
" fix Gitv folding diffs
augroup git
  au!
  autocmd FileType git :setlocal foldlevel=99
augroup END
"}}}

" Tmux ----------------------------------------------------------------------------------------- {{{
" Vimux: sends portion of text from a vim buffer to a running tmux session --------------------- {{{
let g:VimuxUseNearest = 1
let g:VimuxOrientation = 'h'
let g:VimuxHeight = 40

function! VimuxSlime(text)
  call VimuxSendKeys("q")
  call VimuxSendKeys("C-u")
  if len(split(a:text, '\n\zs')) > 1
    call VimuxSendText("%paste\n")
  else
    call VimuxSendText(a:text . "\n")
  endif
endfunction

function! VimuxIpythonVenv()
  if !empty($VIRTUAL_ENV)
    call VimuxOpenRunner()
    let env_name = $VIRTUAL_ENV
    call VimuxRunCommand('source ' . env_name . '/bin/activate')
    call VimuxSendKeys("C-f C-l")
  endif
  VimuxRunCommand('ipython')
endfunction

nnoremap <localleader>vo :call VimuxOpenRunner()<CR>
vnoremap <localleader>z "+y :call VimuxSlime(@+)<CR>`]j
nnoremap <localleader>z V"+y :call VimuxSlime(@+)<CR>`]j
if has('macunix')
  nnoremap <localleader>V :VimuxRunCommand('ipython')<CR>
elseif has('unix')
  nnoremap <localleader>V :VimuxRunCommand('conda activate ' . $CONDA_DEFAULT_ENV . '; ipython')<CR>
endif
" nnoremap <localleader>V :call VimuxIpython()<CR>

" }}}

" Vim Tmux Navigator: allows to navigate seamlessly between vim and tmux splits ---------------- {{{
let g:tmux_navigator_save_on_switch = 0
let g:tmux_navigator_disable_when_zoomed = 1
"}}}
" }}}

" Set appearance ------------------------------------------------------------------------------- {{{

" Yggdroot/indentLine -------------------------------------------------------------------------- {{{
let g:indentLine_setColors = 1
let g:indentLine_char = '︙'
let g:indentLine_enabled = 0
nnoremap <silent> <Leader>ti :IndentLinesToggle<cr>
" }}}

" Vim-airline ---------------------------------------------------------------------------------- {{{
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
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"

let g:airline#extensions#tmuxline#enabled = 0

" Add Textwidth and format options to a status line
function! AirlineInit()
  let g:airline_section_y = airline#section#create_right(['ffenc'])
endfunction
" Hope to avoid this annoying paste
noremap <silent> <Plug>AirlineTablineRefresh :set mod!<CR>
" }}}
" Switch syntax highlighting on, when the terminal has colors.
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax enable
  set hlsearch
endif

" Decent settings for Terminal and GUI
if has("gui_running")
  if has('macunix')
    set transparency=0                   " No transparency
    set guifont=Menlo\ Regular\ for\ Powerline\:h12 " Fonts for powerline
  elseif has('unix')
    set guifont=Menlo\ for\ Powerline\ 10 " Fonts for powerline
  endif
    set guicursor+=a:blinkon0            " No blinking cursor
endif
set background=dark
if (has("termguicolors"))
  set termguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  colorscheme iceberg
  let g:airline_theme = 'iceberg'
  let &t_ut=""
else
  colorscheme vimberry
endif
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

" Toggle highlighting of excessive characters
nnoremap <leader>th :call ToggleHighlight()<cr>
" Toggle colorcolumn display
nnoremap <leader>tb :call ToggleBar()<cr>
" Resize splits when the window is resized
au VimResized * :wincmd =

" python syntax highlight
let g:python_highlight_all = 1
let g:python_highlight_operators = 0
let g:python_highlight_file_headers_as_comments=1
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0
" }}}

" Syntax and code completion ------------------------------------------------------------------- {{{
set omnifunc=syntaxcomplete#Complete

" Don't open preview window
" set completeopt-=preview
set completeopt=menuone,longest

" Let Enter accept matches
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Map CTRL-X function in insert mode
inoremap <c-k> <c-x><c-k>
inoremap <c-]> <c-x>s

" Syntastic: syntax check ---------------------------------------------------------------------- {{{
    " Called by <F7>. To enable check in python:
    " $ pip install flake8
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = 'E>'
let g:syntastic_warning_symbol = 'W>'
let g:syntastic_loc_list_height = 5
" let g:syntastic_ignore_files = ['\m\c\.py$']
let g:syntastic_tex_checkers = ['chktex']
let g:syntastic_python_checkers = ['flake8']
nnoremap <F7> :SyntasticCheck<cr>
nnoremap <localleader>G :SyntasticToggleMode<cr>
nnoremap <localleader>l :Errors<cr>
let g:syntastic_enable_highlighting = 0
" }}}

" UltniSnips: snippet management for vim ------------------------------------------------------- {{{
let g:UltiSnipsListSnippets = "<F1>"
let g:ultisnips_python_style = "google"
let g:ultisnips_python_quoting_style = "single"
let g:ultisnips_python_triple_quoting_style = "double"
let g:snips_author = "Mariia Fedotenkova"
" }}}

" Plugins for code completion ------------------------------------------------------------------ {{{

" SuperTab: allows completion with Tab --------------------------------------------------------- {{{
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabCompletionContexts = ['s:ContextText','s:ContextDiscover']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextTextOmniPrecedence = ['&completefunc', '&omnifunc']
let g:SuperTabMappingBackward = "<c-tab>"
let g:SuperTabMappingTabLiteral = "<s-tab>"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCrMapping = 1
let g:SuperTabClosePreviewOnPopupClose = 1
augroup compl
  au!
  autocmd FileType *
      \ if &omnifunc != '' |
      \   call SuperTabChain(&omnifunc, "<c-p>") |
      \ endif
augroup END
" }}}

" YouCompleteMe: code-completion engine--------------------------------------------------------- {{{
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

" Clang_complete: C code-completion using clang ------------------------------------------------ {{{
let g:clang_close_preview = 1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1
let g:clang_auto_select = 1
if has('macunix')
  let g:clang_library_path = "/Library/Developer/CommandLineTools/usr/lib/"
elseif has('unix')
  let g:clang_library_path = "/usr/lib/llvm-6.0/lib/libclang-6.0.so.1"
endif
let g:clang_user_options='|| exit 0'
" }}}

" Jedi-Vim: code-completion for python --------------------------------------------------------- {{{
    " Cheat sheet ------------------------------------------------------------------------------ {{{
    " - Completion <C-Space>
    " - Goto assignments <localleader>g (typical goto function)
    " - Goto definitions <localleader>d (follow identifier as far as possible, includes
    " imports and statements)
    " - Show Documentation/Pydoc K (shows a popup with assignments)
    " - Renaming <localleader>r
    " - Usages <localleader>N (shows all the usages of a name)
    " Open module, e.g. :Pyimport os (opens the os module) }}}

let g:jedi#force_py_version = 3
let g:jedi#completions_command = "<C-Space>"
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_splits_not_buffers = ""
let g:jedi#popup_select_first = 1
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<localleader>g"
let g:jedi#goto_assignments_command = "<localleader>a"
let g:jedi#goto_definitions_command = "<localleader>d"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#max_doc_height = 30
let g:jedi#usages_command = "<localleader>N"
" let g:jedi#rename_command = "<localleader>r"
let g:jedi#rename_command = ""
let g:jedi#completions_enabled = 1
"}}}

" PyMode: Python support for vim --------------------------------------------------------------- {{{
" let g:pymode_paths = []
" let g:pymode_trim_whitespaces = 0
" let g:pymode_options = 0
" let g:pymode_options_max_line_length = 100
" let g:pymode_options_colorcolumn = 0
" let g:pymode_python = 'python3'
" let g:pymode_indent = 0
" let g:pymode_folding = 0
" let g:pymode_motion = 1
" let g:pymode_doc = 0
" let g:pymode_doc_bind = ''
" let g:pymode_virtualenv = 1
" let g:pymode_lint = 0
" let g:pymode_rope = 0
" let g:pymode_rope_lookup_project = 1
" let g:pymode_rope_show_doc_bind = ''
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_completion_bind = ''
" let g:pymode_rope_autoimport_modules = []
" let g:pymode_rope_goto_definition_bind=''
" let g:pymode_rope_goto_definition_cmd = 'vnew'
" let g:pymode_rope_rename_bind = '<localleader>rr'
" let g:pymode_rope_rename_module_bind = '<localleader>r1r'
" let g:pymode_rope_organize_imports_bind = '<localleader>ro'
" let g:pymode_rope_module_to_package_bind = '<localleader>r1p'
" let g:pymode_rope_extract_method_bind = '<localleader>rm'
" let g:pymode_rope_extract_variable_bind = '<localleader>rl'
" let g:pymode_rope_use_function_bind = '<localleader>ru'
" let g:pymode_rope_move_bind = '<localleader>rv'
" let g:pymode_rope_change_signature_bind = '<localleader>rs'
" let g:pymode_syntax = 0
" }}}


" vimtex: Plugin for easier LaTeX compilation -------------------------------------------------- {{{
" let g:tex_flavor = 'latex' " to start .tex-files as latex
" let g:vimtex_complete_close_braces = 1
" let g:vimtex_fold_enabled = 1
" let g:vimtex_fold_manual = 1
" let g:vimtex_fold_sections = [
        " \ "part",
        " \ "chapter",
        " \ "section",
        " \ "subsection",
        " \ "subsubsection",
        " \ "paragraph",
        " \ ]
" let g:vimtex_quickfix_ignored_warnings = [
            " \ 'Underfull',
            " \ 'Overfull',
            " \ 'Package etoolbox',
            " \ ]
" let g:vimtex_view_general_viewer
            " \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'
" augroup latexSurround
     " autocmd!
     " autocmd FileType tex call s:latexSurround()
  " augroup END

  " function! s:latexSurround()
     " let b:surround_{char2nr("e")}
       " \ = "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"
     " let b:surround_{char2nr("c")} = "\\\1command: \1{\r}"
  " endfunction
" " This adds a callback hook that updates Skim after compilation {{{
" let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
" function! UpdateSkim(status)
    " if !a:status | return | endif

    " let l:out = b:vimtex.out()
    " let l:tex = expand('%:p')
    " let l:cmd = [g:vimtex_view_general_viewer, '-r']
    " if !empty(system('pgrep Skim'))
        " call extend(l:cmd, ['-g'])
    " endif
    " if has('nvim')
        " call jobstart(l:cmd + [line('.'), l:out, l:tex])
    " elseif has('job')
        " call job_start(l:cmd + [line('.'), l:out, l:tex])
    " else
        " call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
    " endif
" endfunction "}}}
" " let g:vimtex_quickfix_ignore_all_warnings = 1
" " let g:vimtex_latexmk_options = '-pdf -verbose -file-line-error -synctex=1 -interaction=nonstopmode'
" " let g:vimtex_complete_img_use_tail = 1
" " let g:vimtex_latexmk_continuous = 1
" " let g:vimtex_latexmk_background = 0
" }}}

" }}}

" Plugins for code styling --------------------------------------------------------------------- {{{
" vim-autoformat: plugin for formatting the code ----------------------------------------------- {{{
let g:formatters_python = ['black']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
" let g:formatter_yapf_style = 'pep8'
vnoremap <F8> :Autoformat<cr>
nnoremap <F8> :Autoformat<cr>
" }}}

" }}}

" }}}

" Comments, brackets, text objects, etc. ------------------------------------------------------- {{{
" vim-targets {{{
let g:targets_seekRanges = 'cr cb cB lc ac Ac lr lb ar ab lB Ar aB Ab AB rr ll rb al rB Al bb aa bB Aa BB AA'
" }}}

" NERDCommenter: makes commenting easier ------------------------------------------------------- {{{
    " http://spf13.com/post/vim-plugins-nerd-commenter
let g:NERDSpaceDelims = 1         " adds extra spaces to comment
let g:NERDDefaultAlign='both'     " align comments to the left
let g:NERDCompactSexyComs = 1     " make block comments more compact
let g:NERDCustomDelimiters = {'python': {'left': '#'}} " otherwise two extra spaces in python
" }}}

" }}}

" Spelling ------------------------------------------------------------------------------------- {{{
" Enable spell check with F4"
nnoremap <F4> :setlocal spell!<CR>
inoremap <F4> <c-o>:setlocal spell!<CR>
set dictionary=/usr/share/dict/words
" }}}

" Foldings ------------------------------------------------------------------------------------- {{{
set foldlevelstart=0
set foldmethod=marker
set foldmarker={{{,}}}
" Open fold with cursor and center it in the window
nnoremap zv zvzz
" Close all folds except current and center it in the window
nnoremap z, zMzvzz
" Close all folds and center cursor
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

" SimpylFold settings
" let g:SimpylFold_docstring_preview=1

" Markdown folding settings
let g:markdown_fold_style = 'nested'
" }}}

" File type specific options ------------------------------------------------------------------- {{{
" C-family
augroup ft_c
  au!
  autocmd FileType c setlocal foldmethod=syntax foldnestmax=2
  autocmd FileType c setlocal formatoptions=croq1j
  autocmd FileType c setlocal comments-=:// comments+=fb://
augroup END
" Python
augroup ft_py
  au!
  autocmd FileType python setlocal formatoptions=cqj
  autocmd FileType python setlocal tw=88
  autocmd FileType python setlocal iskeyword+=_
  " autocmd FileType python let g:NERDSpaceDelims=0
augroup END
" Latex
augroup ft_tex
  au!
  autocmd FileType tex setlocal tw=100
  autocmd FileType tex setlocal dictionary=~/.vim/dictionaries/tex
  autocmd FileType tex setlocal complete+=k
  autocmd FileType tex setlocal fo+=j
augroup END
" Markdown
augroup ft_md
  au!
  autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
  autocmd BufNewFile,BufRead *.md call ToggleBar()
augroup END
" Vim
augroup ft_vim
  au!
  autocmd FileType vim setlocal fo=cq
  autocmd FileType vim setlocal sw=2
  autocmd FileType vim setlocal sts=2
augroup END
" Makefile: do not expand tabs to spaces
augroup ft_make
  au!
  autocmd FileType make setlocal noexpandtab
augroup END
" JSON
augroup ft_json
  au!
  autocmd FileType json setlocal foldmethod=syntax
  autocmd FileType json setlocal foldlevelstart=1
  autocmd FileType json setlocal ts=4
  autocmd FileType json setlocal sw=2
  autocmd FileType json setlocal sts=2
augroup END
" }}}
