" 自动命令组
augroup user_events
	autocmd!
augroup END

" global leader & loacal leader
let g:mapleader=','
let g:maplocalleader=';'

" -------------------------- set options -------------------------------
" General
set cursorline
set encoding=utf8
set number 
set mouse=c             " Disable mouse in command-line mode
set modeline            " automatically setting options from modelines
set nowrap              " No wrap by default
set linebreak           " Break long lines at 'breakat'
set breakat=\ \	;:,!?   " Long lines break chars

" Tabs And Indents
set expandtab    " use space instead of tab
set tabstop=4    " set tab width to 4 spaces
set shiftwidth=4 " auto indented with the reindent operations


" Searching
set ignorecase		    " Search ignoring case
set smartcase			" Keep case when searching with *
set infercase			" Adjust case in insert completion mode
set incsearch			" Incremental search
set wrapscan			" Searches wrap around the end of the file

set complete=.,w,b,k	" C-n completion: Scan buffers, windows and dictionary

" UI
set termguicolors

" Dev
let g:python_host_prog  = '/Users/louisun/.pyenv/shims/python'
let g:python3_host_prog = '/Users/louisun/.pyenv/shims/python'

