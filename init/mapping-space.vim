" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" vim-which-key 映射键提示
nnoremap <Space> :WhichKey '<Space>'<CR>
vnoremap <Space> :WhichKeyVisual '<Space>'<CR>
let g:space_key_map =  {}
let g:space_key_visual_map =  {}
call which_key#register('<Space>', "g:space_key_map", 'n')
call which_key#register('<Space>', "g:space_key_visual_map", 'v')

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────

let g:space_key_map.f =  { 'name': 'call 函数' }

nnoremap <silent> <Space>fa :<C-u>lua rz_parse_timestamp()<CR>
let g:space_key_map.f.a = '时间戳解析'

nnoremap <silent> <Space>fb :<C-u>lua rz_get_timestamp()<CR>
let g:space_key_map.f.b = '获取当前时间戳'


" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────

let g:space_key_map.g =  { 'name': 'git / go' }

" [fugitive] git blame
nnoremap <silent> <Space>gb :<C-u>Git blame<CR>
let g:space_key_map.g.b = 'Git Blame'

" [fugitive] git diff 分窗口查看
nnoremap <silent> <Space>gd :<C-u>Gdiffsplit<CR>
let g:space_key_map.g.d = 'Git Diff'

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" [vim-go] 填充结构体
inoremap <Space>gf <esc>:GoFillStruct<CR>
nnoremap <Space>gf :GoFillStruct<CR>
let g:space_key_map.g.f = 'Go 填充结构体'

nnoremap <Space>gr <esc>:GoRename<CR>
let g:space_key_map.g.r = 'Go 重命名'

" [vim-go] 直接运行 go 文件
autocmd FIleType go nmap <Space>xr <Plug>(go-run)

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" [startify] back home
nnoremap <silent> <Space>bh :<C-u>Startify<CR>

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────
" [goyo] zen mode
nnoremap <silent> <Space>zz :<C-u>Goyo<CR>

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────

" [ale] ALEToggle
nnoremap <silent> <Space>lt :<C-u>ALEToggle<CR>

" ─────────────────────────⋆⋅☆⋅⋆ ─────────────────────────

" [markdwon-preview] 预览 markdown
nnoremap <silent> <Space>mp :<C-u>MarkdownPreviewToggle<CR>

