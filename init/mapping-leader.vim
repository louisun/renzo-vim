" leader which-key
nnoremap <Leader> :<c-u>WhichKey ','<CR>
vnoremap <Leader> :<c-u>WhichKeyVisual ','<CR>
let g:leader_key_map =  {}
let g:leader_key_visual_map =  {}
call which_key#register(',', "g:leader_key_map", 'n')
call which_key#register(',', "g:leader_key_visual_map", 'v')


" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" s - PREFIX：文本搜索 / 加载

let g:leader_key_map.s = { 'name' : '文本搜索 / 加载' }

" [vim-easymotion] <Leader>f{char} to move to {char}
map  <Leader>sf <Plug>(easymotion-bd-f)
nmap <Leader>sf <Plug>(easymotion-overwin-f)
let g:leader_key_map.s.f = '[easymotion] 单字符定位'

map <Leader>sl <Plug>(easymotion-bd-jk)
nmap <Leader>sl <Plug>(easymotion-overwin-line)
let g:leader_key_map.s.l = '[easymotion] 行定位'

" ,sv -> 重载 vim 配置
nnoremap <Leader>sv :source $MYVIMRC<CR>
let g:leader_key_map.s.v = '重载 vim 配置'


" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" e - PREFIX: 文本编辑

let g:leader_key_map.e = { 'name' : '文本编辑' }
let g:leader_key_visual_map.e = { 'name' : '文本编辑' }

" ,r -> 直接替换当前光标下所在的单词为输入内容
" NOTE: :<C-u> 是插入模式清除光标位置到行首的所有文本内容
" NOTE: <C-r> 在插入模式下，按下 <C-r> 后，接着按一个寄存器名（如 a、0、" 等），可以将该寄存器中的内容插入到当前光标位置
" NOTE: <C-r><C-w> 将当前光标下的单词插入到光标位置
" NOTE: \< 和 \> 是用于匹配单词的锚定符号。当它们包围一个模式时，表示只匹配完整的单词，而不是单词的一部分。
nnoremap <Leader>er :%s/\<<C-r><C-w>\>//g<Left><Left>
let g:leader_key_map.e.r = '替换光标下单词'

" "z 表示寄存器 z, 然后 y 会将选择的内容复制到寄存器 z，<C-r>z 是插入寄存器 z 的内容
" xnoremap <Leader>er "zy:%s/<C-r>z//g<Left><Left>
xnoremap <Leader>er "zy:execute '%s/' . escape(@z, '/\') . '/' . input('Replace with: ') . '/g'<CR>
let g:leader_key_visual_map.e.r = '替换所选内容'



" 拖动行到上一行
nnoremap <Leader>ek :m-2<CR>
vnoremap <Leader>ek :m'<-2<CR>gv=gv
let g:leader_key_map.e.k = '拖拽到上一行'
let g:leader_key_visual_map.e.k = '拖拽到上一行'

" 拖动行到下一行
nnoremap <Leader>ej :m+<CR>
vnoremap <Leader>ej :m'>+<CR>gv=gv
let g:leader_key_map.e.j = '拖拽到下一行'
let g:leader_key_visual_map.e.j = '拖拽到下一行'

nnoremap <Leader>ef :Autoformat<CR>
let g:leader_key_visual_map.e.f = '代码格式化'


vnoremap <Leader>ea :EasyAlign //<Left>
let g:leader_key_visual_map.e.a = '对齐（正则）'


nnoremap <Leader>0 vip:EasyAlign /--/<CR>
" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" v - PREFIX: 注释

" nerdcommenter
nnoremap <silent> <Leader>v :call nerdcommenter#Comment('n', 'toggle')<CR>
vnoremap <silent> <Leader>v :call nerdcommenter#Comment('x', 'toggle')<CR>
let g:leader_key_map.v = '注释 toggle'
let g:leader_key_visual_map.v = '注释 toggle'

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" c - PREFIX: 复制

let g:leader_key_map.c = { 'name' : '复制' }
let g:leader_key_visual_map.c = { 'name' : '复制' }

" 重复一行
nnoremap <Leader>cl m`YP``
let g:leader_key_map.c.l = '重复一行'

vnoremap <Leader>cl YPg
let g:leader_key_visual_map.c.l = '重复一行'

" 重复一段
nnoremap <Leader>cp yap<S-}>p
let g:leader_key_map.c.p = '重复一段'

" ,y -> 复制相对路径 / 绝对路径到系统剪贴板
nnoremap <Leader>cy :let @+=expand("%:~:.")<CR>:echo 'Yanked relative path'<CR>
nnoremap <Leader>cY :let @+=expand("%:p")<CR>:echo 'Yanked absolute path'<CR>
let g:leader_key_map.c.y = '复制文件相对路径'
let g:leader_key_map.c.Y = '复制文件绝对路径'
" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" o - PREFIX: o

let g:leader_key_map.o = { 'name' : '+prefix' }

" ,op 粘贴到下一行
nnoremap <Leader>op :call PasteSystemOnCondition()<CR>
let g:leader_key_map.o.p = '粘贴系统剪贴板到下一行'

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" y - PREFIX: y

" ,y -> 系统剪贴板 copy
" ,p -> 系统剪贴板 paste
if g:is_ssh == 1
    vnoremap <Leader>y "*y:call SendToRemoteClipboard()<CR>
    nnoremap <Leader>p :call GetRemoteClipboard() <Bar> call PasteSystemOnCondition()<CR>
    let g:leader_key_visual_map.y = '复制:到远程剪贴板'
    let g:leader_key_map.p = '粘贴:远程剪贴板'
else
    vnoremap <Leader>y "*y
    nnoremap <Leader>p :call PasteSystemOnCondition()<CR>
    let g:leader_key_visual_map.y = '复制:系统剪贴板'
    let g:leader_key_map.p = '粘贴:系统剪贴板'
endif


" -------------------------- 缓冲区 ------------------------------

" 快捷退出
noremap <Leader>E :qa!<CR>
let g:leader_key_map['E'] = '强制退出 qa!'

" ;w -> :update 文件更新
imap <Leader>w <esc>:update<CR>
nnoremap <Leader>w <esc>:update<CR>
let g:leader_key_map['w'] = '文件写入'


" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────

" C-w which-key
" let g:which_key_window_map = {
"             \ 'name' : '+windows',
"             \ 'w' : [':wincmd w',  'other-window'],
"             \ 'c' : [':wincmd c',  'delete-window'],
"             \ 's' : [':wincmd s',  'split-window-below'],
"             \ 'v' : [':wincmd v',  'split-window-right'],
"             \ 'h' : [':wincmd h',  'window-left'],
"             \ 'j' : [':wincmd j',  'window-below'],
"             \ 'l' : [':wincmd l',  'window-right'],
"             \ 'k' : [':wincmd k',  'window-up'],
"             \ 'H' : [':wincmd H',  'move-window-left'],
"             \ 'J' : [':wincmd J',  'move-window-below'],
"             \ 'L' : [':wincmd L',  'move-window-right'],
"             \ 'K' : [':wincmd K',  'move-window-up'],
"             \ '=' : [':wincmd =',  'balance-window'],
"             \ }
" call which_key#register("<C-w>",   "g:which_key_window_map")
" nnoremap <silent> <C-w> :<c-u>WhichKey '<lt>C-w>'<CR>

