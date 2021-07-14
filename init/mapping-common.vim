
" NOTE: 快捷键定位
" e             => 窗口操作
" z             => 窗口操作
" <Leader>      => 编辑器操作 | 核心功能
" <LocalLeader> => 界面辅助操作
" <Space>       => 辅助操作、插件

" z; z, -> , ; 代替键
nnoremap z; ;
nnoremap z, ,
" -------------------------- 操作 ------------------------------


" jk jj -> 快速切换 normal 模式
inoremap jk <Esc>`^
inoremap jj <Esc>`^

" gh, gl -> 移动光标行首行尾
nnoremap gh g^
nnoremap gl g$

" z + l/h/j/k -> 滚动
nnoremap zl z4l
nnoremap zh z4h
nnoremap zj <c-d>
nnoremap zk <c-u>

" >> << -> 缩进，并跳转到第一个非空字符
nmap >>  >>_
nmap <<  <<_


" Enter -> 回车折叠
nnoremap <CR> za

" Shift Enter -> 折叠所有的代码
" 然后打开光标下的折叠，并将当前行移动到窗口的顶部
nnoremap <S-Return> zMzvzt

" ctrl + \ -> 启用黑洞寄存器
nnoremap <C-\> "_

" -------------------------- 文本操作 ------------------------------


" [v] sg -> visual 模式下，快速替换选中的内容，需要自己输入 old_str/replace_str
vnoremap sg :s///g<Left><Left><Left>

" gp -> 选中最后一次复制的内容（寄存器的值）
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'


" -------------------------- 缓冲区 ------------------------------


" 在打开文件后，将光标移动到上次编辑的位置
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif

" q -> 直接退出（针对所有 buffer）
autocmd user_events BufWinEnter * nnoremap <silent><buffer> q :call ConfirmQuit()<CR>

" Q -> q，q 原先用于宏，使用 Q 代替，比如 Qa 记录宏 a，可使用 @a 重复调用
nnoremap Q q
" gQ -> @q，代替不可用的 @q
nnoremap gQ @q

nmap [1 :lprev<CR>
nmap [2 :lnext<CR>
nmap [z :cprev<CR>
nmap [x :cnext<CR>


" -------------------------- 窗口 / 标签 --------------------------------

nnoremap e :<c-u>WhichKey 'e'<CR>
let g:e_key_map =  {}
call which_key#register('e', "g:e_key_map", 'n')

let g:e_key_map = { 'name' : '缓冲区 / 标签' }

nnoremap <silent> e[ :bprevious<CR>
nnoremap <silent> e] :bnext<CR>
let g:e_key_map['['] = '上一个 buffer'
let g:e_key_map[']'] = '下一个 buffer'

noremap eh <C-w>h
noremap ej <C-w>j
noremap ek <C-w>k
noremap el <C-w>l
let g:e_key_map.h = '选择窗口: Left'
let g:e_key_map.j = '选择窗口: Down'
let g:e_key_map.k = '选择窗口: Up'
let g:e_key_map.l = '选择窗口: Right'

noremap eH <C-w>H
noremap eJ <C-w>J
noremap eK <C-w>K
noremap eL <C-w>L
noremap e= <C-w>=
noremap er <C-w>r
noremap eR <C-w>R
let g:e_key_map.H = '移动窗口: Left'
let g:e_key_map.J = '移动窗口: Down'
let g:e_key_map.K = '移动窗口: Up'
let g:e_key_map.L = '移动窗口: RigHt'
let g:e_key_map['='] = '平衡窗口'
let g:e_key_map['r'] = '向右下旋转窗口'
let g:e_key_map['R'] = '向左上旋转窗口'


let g:e_key_map.c = { 'name' : '关闭' }
noremap ecn <c-w>c
noremap eco <c-w>o
let g:e_key_map.c.n = '关闭当前窗口'
let g:e_key_map.c.o = '关闭其他窗口'

" Tab s -> split 窗口，选择上一个窗口并在新窗口打开上一个文件
" NOTE: :e# 打开上一个文件
noremap es :split<CR>:wincmd p<CR>:e#<CR>
" Tab v -> vsplit 窗口，选择上一个窗口并在新窗口打开上一个文件
noremap ev :vsplit<CR>:wincmd p<CR>:e#<CR>


" tab 标签前后跳转
nnoremap <Tab>[ :tabprevious<CR>
nnoremap <Tab>] :tabnext<CR>
nnoremap <Tab><Tab> :tabnext<CR>

" 新建 tab 标签
nnoremap <Tab>n :tab split<CR>
" 关闭 tab 标签
nnoremap <Tab>q :tab close<CR>

" [insert] Ctrl-a Ctrl-e 等操作
cnoremap <c-a> <home>
inoremap <c-a> <home>
inoremap <c-e> <end>
" 代替原有 <c-a> 加光标下数字的功能
inoremap <c-m><c-a> <c-a>


" NOTE: 二合字母用来输入不能用普通键盘输入的字符。它们通常是可显示的非 ASCII 字符。
" 二合字母比用 CTRL-V 输入十进制编码更方便记忆 (见 |i_CTRL-V|)。
" C-_ | C-K 输入特殊符号 :help digraph-table
inoremap <c-_> <c-k>


" 打开 help 文件类型时，将 help窗口 放到右侧位置
autocmd FileType help wincmd L


" --------------------------- 命令行 -----------------------------


" w!! -> 接口 sudo 写入
cnoremap w!! w !sudo tee % > /dev/null

" Ctrl h / l -> 移动到最前 / 最后
cnoremap <C-h> <Home>
cnoremap <C-l> <End>

" Ctrl b / f -> 移动光标到前一个 /后一个位置
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" vim-smooth-scroll
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" vim-floaterm
nnoremap <silent> <C-z> :FloatermToggle<Enter>
tnoremap <silent> <C-z> <C-\><C-n>:FloatermToggle<Enter>

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" vim-easymotion

" ss{char}{char} to move to {char}{char}
nmap ss <Plug>(easymotion-s2)

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" vim-easy-align
"
" ga -> 选中状态下 ga<?>，如 vipga 选中当前段落，使用 ga 对其，后跟对齐字符如 "
" NOTE: vip 即 visual inner paragraph，跟 vap 类似
xmap ga <Plug>(EasyAlign)

" ga -> normal 模式下 ga，可以不选中如 gaip<?> 对当前段落进行对齐
" NOTE: ip 即 inner paragraph 的意思
nmap ga <Plug>(EasyAlign)

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" clever-f

" MAP_NOTE:  [clever-f] <nmap, xmap, omap> f 向后跳转，代替 ;
" MAP_NOTE:  [clever-f] <nmap, xmap, omap> F 向前跳转，代替 ,
" MAP_NOTE:  [clever-f] <nmap, xmap, omap> t 代替 t
" MAP_NOTE:  [clever-f] <nmap, xmap, omap> T 代替 T

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" vim-gtfo

" MAP_NOTE:  [vim-gtfo] <nmap> gof 打开当前文件目录
" MAP_NOTE:  [vim-gtfo] <nmap> goF 打开当前工作目录 :pwd
" MAP_NOTE:  [vim-gtfo] <nmap> got 打开终端，cd 当前文件目录
" MAP_NOTE:  [vim-gtfo] <nmap> goT 打开终端，cd 当前工作目录 :pwd
