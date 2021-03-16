call plug#begin('~/.cache/plugins')

" -------------------- 主题 ---------------------

Plug 'louisun/miramare'
Plug 'embark-theme/vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wadackel/vim-dogrun'

" -------------------- 窗口 ---------------------

Plug 'Shougo/defx.nvim',  { 'do': ':UpdateRemotePlugins'} " 侧边栏目录
Plug 'kristijanhusak/defx-git'                            " 侧边栏 git 支持
Plug 'kristijanhusak/defx-icons'                          " 侧边栏 icon

" -------------------- 功能 ----------------------

Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() }, 'tag': 'v0.23' }
Plug 'liuchengxu/vim-which-key', { 'on':  ['WhichKey', 'WhichKey!'] } " 按键提示
Plug 'voldikss/vim-floaterm'                                          " 浮动窗口
Plug 'airblade/vim-gitgutter'                                         " 侧边栏 git 显示
Plug 'preservim/nerdcommenter'                                        " comment plugin
Plug 'easymotion/vim-easymotion'                                      " 快速移动
Plug 'tpope/vim-surround'                                             " quoting/parenthesizing made simple
Plug 'Raimondi/delimitMate'                                           " 自动匹配符号
Plug 'justinmk/vim-gtfo'                                              " 文件目录 gof goF（工作目录）| 终端 got goT （工作目录）
Plug 'mhinz/vim-startify'                                             " 启动页
Plug 'junegunn/vim-easy-align'                                        " ga<ip> 符号
Plug 'mg979/vim-visual-multi', {'branch': 'master'}                   " 多光标操作
Plug 'tyru/open-browser.vim'                                          " 浏览器支持
Plug 'junegunn/goyo.vim', { 'on': ['Goyo'] }                          " Distraction-free writing in Vim
Plug 'terryma/vim-smooth-scroll'                                      " 平滑滚动
Plug 'yianwillis/vimcdoc'                                             " vim 中文文档
Plug 'rhysd/clever-f.vim'                                             " 扩展 f F t T 跳转

" -------------------- Dev ---------------------

Plug 'neoclide/coc.nvim', { 'branch': 'release'}                                                                   " LSP 服务
Plug 'Shougo/echodoc.vim', { 'for': ['go']  }                                                                      " 调函数时自动显示文档
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go']  }                                                 " Golang 支持
Plug 'preservim/tagbar'                                                                                            " 代码结构侧边栏
Plug 'dense-analysis/ale'                                                                                          " Linting
Plug 'tpope/vim-fugitive'                                                                                          " git wrapper
Plug 'honza/vim-snippets'                                                                                          " 各语言 snippets
Plug 'sheerun/vim-polyglot'                                                                                        " language pack
Plug 'louisun/plantuml-previewer.vim', { 'on': ['PlantumlOpen', 'PlantumlSave', 'PlantumlStart', 'PlantumlStop'] } " plantuml 生成
Plug 'plasticboy/vim-markdown'                                                                                     " markdown 语法支持
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}          " markdown 同步预览

call plug#end()
