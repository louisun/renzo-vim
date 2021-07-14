" local leader which-key
nnoremap <LocalLeader> :<c-u>WhichKey ';'<CR>
vnoremap <LocalLeader> :<c-u>WhichKeyVisual ';'<CR>
let g:local_leader_key_map =  {}
let g:local_leader_key_visual_map =  {}
call which_key#register(';', "g:local_leader_key_map", 'n')
call which_key#register(';', "g:local_leader_key_visual_map", 'v')


" ;1 -> 清空高亮
nnoremap <LocalLeader>1 :noh<CR>
let g:local_leader_key_map.1 = '清除高亮'

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" c - PREFIX: 命令行快捷键

let g:local_leader_key_map.c = { 'name': ':Command 快捷键+' }

" 快速设置语法 :set syntax=
nnoremap <LocalLeader>cs :set filetype=
let g:local_leader_key_map.c.s = '设置filetype'

" 切换到 nvim home 目录
nnoremap <LocalLeader>cd :execute 'cd ' . g:home<CR>
let g:local_leader_key_map.c.d = 'cd nvim 配置目录'

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" defx.nvim
nnoremap <silent> <LocalLeader>ee
            \ :<C-u>Defx -toggle `getcwd()` -buffer-name=tab`tabpagenr()`<CR>
nnoremap <silent> <LocalLeader>en
            \ :<C-u>Defx `getcwd()` -search=`expand('%:p')` -buffer-name=tab`tabpagenr()`<CR>


" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" telescope
nnoremap <LocalLeader>; <cmd>Telescope find_files find_command=rg,--no-ignore,--files prompt_prefix=🔍<cr>
let g:local_leader_key_map[';'] = '文件查找'

let g:local_leader_key_map.f = { 'name' : 'Telescope 查找+' }

nnoremap <LocalLeader>ff <cmd>Telescope live_grep<cr>
let g:local_leader_key_map.f.f = '实时 Grep 内容查找'
nnoremap <LocalLeader>fb <cmd>Telescope buffers<cr>
let g:local_leader_key_map.f.b = 'Buffer 缓冲区查找'
nnoremap <LocalLeader>fh <cmd>Telescope help_tags<cr>
let g:local_leader_key_map.f.h = 'Tags 查找'
nnoremap <LocalLeader>ft <cmd>Telescope colorscheme<cr>
let g:local_leader_key_map.f.t = 'Themes 主题查找'
nnoremap <LocalLeader>st :call WriteCurrentColorSchemeToFile()<cr>



" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" tagbar
nmap <LocalLeader>a :TagbarToggle<CR>
let g:local_leader_key_map.a = 'Tagbar 侧边栏'

