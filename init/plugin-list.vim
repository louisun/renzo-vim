call plug#begin('~/.cache/plugins')

" -------------------- 主题 ---------------------

Plug 'louisun/miramare'
Plug 'embark-theme/vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wadackel/vim-dogrun'
Plug 'sainnhe/everforest'

" -------------------- 窗口 ---------------------

Plug 'Shougo/defx.nvim',  { 'do': ':UpdateRemotePlugins'} " defx 侧边栏目录
Plug 'kristijanhusak/defx-git'                            " defx-git 侧边栏 git 支持
Plug 'kristijanhusak/defx-icons'                          " defx-icons 侧边栏 icon

" -------------------- 功能 ----------------------

Plug 'sheerun/vim-polyglot'                              " vim-polyglot syntax language pack
Plug 'yianwillis/vimcdoc'                                " vimdoc vim 中文文档
Plug 'rhysd/clever-f.vim'                                " clever-f.vim 扩展 f F t T 跳转
Plug 'nvim-lua/plenary.nvim'                             " plenary telescope 依赖函数库
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' } " telescope.nvim  望远镜搜索
Plug 'liuchengxu/vim-which-key',                         " vim-which-key 按键提示
Plug 'voldikss/vim-floaterm'                             " vim-floaterm 浮动终端
Plug 'airblade/vim-gitgutter'                            " vim-gitgutter 侧边栏 git 显示
Plug 'preservim/nerdcommenter'                           " nerdcommenter 注释插件
Plug 'easymotion/vim-easymotion'                         " vim-easymotion 快速移动
Plug 'tpope/vim-surround'                                " vim-surround
Plug 'Raimondi/delimitMate'                              " delimitMate 自动匹配符号
Plug 'justinmk/vim-gtfo'                                 " vim-gtfo 快速打开文件或终端
Plug 'mhinz/vim-startify'                                " vim-startify 启动页
Plug 'junegunn/vim-easy-align'                           " vim-easy-align 文本对齐
Plug 'junegunn/goyo.vim', { 'on': ['Goyo'] }             " goyo zen mode
Plug 'terryma/vim-smooth-scroll'                         " vim-smooth-scroll 平滑滚动
Plug 'vim-autoformat/vim-autoformat'                     " vim-autoformat 代码格式化


" -------------------- Dev ---------------------

Plug 'neoclide/coc.nvim', { 'branch': 'release'}                                                                   " coc.nvim lsp 服务
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go']  }                                                 " vim-go golang 支持
Plug 'plasticboy/vim-markdown'                                                                                     " vim-markdown 支持
Plug 'Shougo/echodoc.vim', { 'for': ['go']  }                                                                      " echodoc.vim 调函数时自动显示文档
Plug 'preservim/tagbar'                                                                                            " tagbar 代码结构侧边栏
Plug 'dense-analysis/ale'                                                                                          " ale linting
Plug 'tpope/vim-fugitive'                                                                                          " vim-fugitive git wrapper
Plug 'honza/vim-snippets'                                                                                          " vim-snippets 各语言 snippets
Plug 'louisun/plantuml-previewer.vim', { 'on': ['PlantumlOpen', 'PlantumlSave', 'PlantumlStart', 'PlantumlStop'] } " plantuml-previewer 插件
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}          " markdown 同步预览


Plug 'SirVer/ultisnips'   " SirVer/ultisnips 代码片段 engine，下面这两个是一起的
Plug 'honza/vim-snippets' " vim-snippets 自定义代码片段仓库（可替换）

call plug#end()



" ----------------------- 安装插件 ---------------------

if !exists('g:def_init_plugin')
  function! s:install_plugin()
    execute 'source '.$MYVIMRC
    execute 'PlugInstall'
    echo '[VIM PLUG] Install Plugin Finished.'
  endfunction

  command! -nargs=0 InitPlugins call s:install_plugin()

  let g:def_init_plugin=1
endif


" ----------------------- 插件配置 ---------------------

let g:vim_markdown_fenced_languages = ['csharp=cs', 'swift']
