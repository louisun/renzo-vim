let g:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

command! -nargs=1 LoadFile exec 'source ' . g:home . '/' . '<args>'
command! -nargs=1 LoadLuaFile exec 'luafile ' . g:home . '/' . '<args>'

" function 函数
LoadFile init/function.vim
LoadLuaFile lua/function.lua

" setting 设置
LoadFile init/setting.vim

" plug 插件列表
LoadFile init/plugin-list.vim

" map 通用映射
LoadFile init/mapping-common.vim

" map 插件映射
LoadFile init/mapping-leader.vim
LoadFile init/mapping-local-leader.vim
LoadFile init/mapping-space.vim

" appearance 设置
LoadFile init/appearance.vim

" lua 脚本
LoadLuaFile lua/vim-map-viewer.lua

" colorscheme 设置
if filereadable(g:home . '/init/colorscheme-custom.vim')
    LoadFile init/colorscheme-custom.vim
endif
