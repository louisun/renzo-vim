" ------------------------- 文本操作 -----------------------------
nnoremap z; ;
nnoremap z, ,

inoremap jk <Esc>`^
inoremap jj <Esc>`^

" 使用 g + h / l 移动光标行首行尾
nnoremap gh g^
nnoremap gl g$

" Clear Highlight Search
nnoremap <localleader>1 :noh<CR>

" Source Vim Config
nnoremap <leader>sv :source $MYVIMRC<CR>


" Toggle 折叠
nnoremap <CR> za

" Focus the current fold by closing all others
nnoremap <S-Return> zMzvzt

" z + l/h/j/k 方便移动
nnoremap zl z4l
nnoremap zh z4h
nnoremap zj <c-d>
nnoremap zk <c-u>


" Indent and jump to first non-blank character linewise
nmap >>  >>_
nmap <<  <<_

" 选中最后一次粘贴的内容
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'


" 增量搜索时可以用 Tab 和 Shift Tab 切换匹配项
" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
" cnoremap <expr> <Tab>
" 	\ getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
" cnoremap <expr> <S-Tab>
" 	\ getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'


" 快速替换选中的内容
xnoremap sg :s//gc<Left><Left><Left>
" C-r: Easier search and replace visual/select mode
xnoremap <C-r> :<C-u>call <SID>get_selection('/')<CR>:%s/\V<C-R>=@/<CR>//gc<Left><Left><Left>
" Returns visually selected text
function! s:get_selection(cmdtype) "{{{
	let temp = @s
	normal! gv"sy
	let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
	let @s = temp
endfunction "}}}



nnoremap Q q
nnoremap gQ @q

" ------------------------ 文件更新 ------------------------------
imap <leader>w <esc>:update<CR>
nnoremap <leader>w <esc>:update<CR>


" -------------------------- 窗口 --------------------------------
" " Window-control prefix
" nnoremap  [Window]   <Nop>
" nmap      s [Window]
"
" " Split
" nnoremap <silent> [Window]g  :<C-u>split<CR>
" nnoremap <silent> [Window]v  :<C-u>vsplit<CR>
" nnoremap <silent> sc  :close<CR>
"
" " Split current buffer, go to previous window and previous buffer
" nnoremap <silent> [Window]sg :split<CR>:wincmd p<CR>:e#<CR>
" nnoremap <silent> [Window]sv :vsplit<CR>:wincmd p<CR>:e#<CR>


" switch window
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

noremap <tab>h <c-w>h
noremap <tab>j <c-w>j
noremap <tab>k <c-w>k
noremap <tab>l <c-w>l
" duplicate window
noremap <tab>s :split<CR>:wincmd p<CR>:e#<CR>
noremap <tab>v :vsplit<CR>:wincmd p<CR>:e#<CR>

noremap <tab>w <c-w>w
" only leave current window
noremap <tab>o <c-w>o 
" close window
noremap <tab>c <c-w>c

" insert mode as emacs
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>
inoremap <c-x><c-a> <c-a>
inoremap <c-x><c-b> <c-e>


" -------------------------- 缓冲区 ------------------------------
nnoremap <silent> <Tab>[ :bprevious<CR>
nnoremap <silent> <Tab>] :bnext<CR>

noremap <leader>e :q<CR>
noremap <leader>E :qa!<CR>


" Location/quickfix list movement
" rz: similar config in 'config/plugins/all.vim'
" (nmap ]c [c) -> ale config ale_previous ale_next
nmap [1 :lprev<CR>
nmap [2 :lnext<CR>
nmap [z :cprev<CR>
nmap [x :cnext<CR>

autocmd FileType help wincmd L

" Ultimatus Quitos
autocmd user_events BufWinEnter * nnoremap <silent><buffer> q :quit<CR>
" autocmd user_events BufWinEnter * if &buftype == ''
"     \ | nnoremap <silent><buffer> q :quit<CR>
"     \ | endif


" remeber last position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
			\| exe "normal! g'\"" | endif


" persistant undo history
let vimDir = '$HOME/.vim'

if stridx(&runtimepath, expand(vimDir)) == -1
  " vimDir is not on runtimepath, add it
  let &runtimepath.=','.vimDir
endif

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" --------------------------- 标签 -----------------------------
nnoremap <Tab>1 :tabprevious<CR>
nnoremap <Tab>2 :tabnext<CR>

nnoremap tt :tab split<CR>
nnoremap tc :tab close<CR>


" --------------------------- 命令行 -----------------------------
" w!! 接口 sudo 写入
cnoremap w!! w !sudo tee % >/dev/null


" Navigation in command line
cnoremap <C-h> <Home>
cnoremap <C-l> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

" -------------------------- 拷贝 & 粘贴 ----------------------------
" 粘贴到下一行
nnoremap <leader>op :put *<CR>
" 系统剪贴板 copy
nnoremap <leader>y "*yy
vmap <leader>y "*y
" 系统剪贴板 paste
nnoremap <leader>p "*p
nnoremap <leader>P "*P

" Yank buffer's relative/absolute path to clipboard
nnoremap <Leader>y :let @+=expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
nnoremap <Leader>Y :let @+=expand("%:p")<CR>:echo 'Yanked absolute path'<CR>


" Drag lines
nnoremap <leader>k :m-2<CR>
nnoremap <leader>j :m+<CR>
vnoremap <leader>k :m'<-2<CR>gv=gv
vnoremap <leader>j :m'>+<CR>gv=gv

" Duplicate lines
nnoremap <leader>cl m`YP``
vnoremap <leader>cl YPg

" Duplicate paragraph
nnoremap <leader>cp yap<S-}>p


" -------------------------- 插件 ------------------------------------

" smooth_scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" TagBar
nmap <LocalLeader>a :TagbarToggle<CR>

" 悬浮终端显示 / 隐藏
nnoremap <silent> <C-z> :FloatermToggle<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:FloatermToggle<Enter>

" WhcihKey 按键提示：<Leader> <LocalLeader> <Space>
nnoremap <silent> <Leader> :WhichKey '<Leader>'<CR>
nnoremap <silent> <LocalLeader> :WhichKey '<LocalLeader>'<CR>
nnoremap <silent> <Space> :WhichKey '<Space>'<CR>

" EasyMotion
nmap ss <Plug>(easymotion-s2)

" Golang 功能
nnoremap <leader>gf :GoFillStruct<CR>
inoremap <leader>gf <esc>:GoFillStruct<CR>
autocmd FIleType go nmap <Leader>gr <Plug>(go-run)
autocmd BufWritePre *.go :GoImports
" autocmd user_events FileType go
	" \ nmap <Leader>gr  <Plug>(go-run)
	" \ |  nmap <C-]> <Plug>(go-def)
	" \ | nmap <Leader>gd  <Plug>(go-describe)
	" \ | nmap <Leader>gc  <Plug>(go-callees)
	" \ | nmap <Leader>gC  <Plug>(go-callers)
	" \ | nmap <Leader>gi  <Plug>(go-info)
	" \ | nmap <Leader>gm  <Plug>(go-implements)
	" \ | nmap <Leader>gs  <Plug>(go-callstack)
	" \ | nmap <Leader>ge  <Plug>(go-referrers)
	" \ | nmap <Leader>gv  <Plug>(go-vet)
	" \ | nmap fd  <Plug>(go-def-vertical)
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']

" Defx
nnoremap <silent> <LocalLeader>ee
    \ :<C-u>Defx -toggle `getcwd()` -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>en
    \ :<C-u>Defx `getcwd()` -search=`expand('%:p')` -buffer-name=tab`tabpagenr()`<CR>

" Clap
" history 打开文件的历史记录"
nnoremap <silent> <LocalLeader>ch :<C-u>Clap hist:<CR>
" history 打开文件的历史记录"
nnoremap <silent> <LocalLeader>fh :<C-u>Clap history<CR>
" maps 搜索命令快捷键"
nnoremap <silent> <LocalLeader>fm :Clap maps <CR>
" registers 搜索寄存器"
nnoremap <silent> <LocalLeader>fr :<C-u>Clap registers<CR>
" grep2 全局搜索内容"
nnoremap <silent> <LocalLeader>ff :<C-u>Clap grep<CR>
" mark 搜索标记"
nnoremap <silent> <LocalLeader>fb :<C-u>Clap marks<CR>
" command 搜索命令"
nnoremap <silent> <LocalLeader>fc :<C-u>Clap command<CR>
" colors 搜索dotfiles"
nnoremap <silent> <LocalLeader>fd :<C-u>Clap dotfiles<CR>
" files 搜索文件"
nnoremap <silent> <LocalLeader>; :<C-u>Clap files"<cr>
" colors 搜索配色"
nnoremap <silent> <LocalLeader>tc :<C-u>Clap colors<CR>
" buffers 搜索缓冲区"
nnoremap <silent> <LocalLeader>b :<C-u>Clap buffers<CR>

let g:clap_provider_dotfiles = {
    \ 'source': ['~/.config/nvim/init.vim', '~/.zshrc', '~/.gitconfig', '~/.tmux.conf'],
    \ 'sink': 'e',
    \ }

let g:clap_provider_grep_opts = '--hidden -g "!.git/"'

" vim-easyalign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" fugitive.vim
nnoremap <silent> <leader>gb :<C-u>Git blame<CR>
nnoremap <silent> <leader>gd :<C-u>Gdiffsplit<CR>

" goyo
nnoremap <silent> <Space>z :<C-u>Goyo<CR>

" ale
nnoremap <silent> <Space>lt :<C-u>ALEToggle<CR>

" markdwon-preview
nnoremap <silent> <Space>mp :<C-u>MarkdownPreviewToggle<CR>

" nerdcommenter
nnoremap <silent> <leader>v :call NERDComment('n', 'toggle')<CR>
xnoremap <silent> <leader>v :call NERDComment('x', 'toggle')<CR>

" easymotion
" <Leader>f{char} to move to {char}
map  <space>f <Plug>(easymotion-bd-f)
nmap <space>f <Plug>(easymotion-overwin-f)
" ss{char}{char} to move to {char}{char}
" Move to line
map <space>gl <Plug>(easymotion-bd-jk)
nmap <space>gl <Plug>(easymotion-overwin-line)

" Startify
nnoremap <silent> <localleader>s :<C-u>Startify<CR>

" coc-nvim
inoremap <C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>

" memo
nnoremap <silent> <Space>ml :<C-u>MemoList<CR>
nnoremap <silent> <Space>mn :<C-u>MemoCreate date<CR>
