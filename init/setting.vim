" 定义自动命令组 user_events，后面 autocmd 可以使用该敏玲组
augroup user_events
    autocmd!
augroup END

let g:mapleader=','      " Leader -> ,
let g:maplocalleader=';' " LocalLeader -> ;


" -------------------------- 通用设置 -------------------------------

set cursorline        " 显示当前行的光标线
set encoding=utf8     " 设置文件编码为 UTF-8
set number            " 显示行号
set mouse=c           " 在命令行模式下禁用鼠标
set modeline          " 自动从模型行中设置选项
set nowrap            " 默认情况下不自动换行
set linebreak         " 在 'breakat' 处折断长行
set breakat=\ \ ;:,!? " 长行折断字符
set expandtab         " 使用空格代替制表符
set tabstop=4         " 设置制表符宽度为 4 个空格
set shiftwidth=4      " 自动缩进的宽度为 4 个空格
set expandtab
set ignorecase        " 搜索时忽略大小写
set smartcase         " 在使用 * 进行搜索时保留大小写
set infercase         " 在插入完成模式下自动调整大小写
set incsearch         " 增量搜索
set wrapscan          " 搜索时到达文件末尾后继续搜索到文件开头
set complete=.,w,b,k  " 使用 ctrl n 进行自动完成：扫描缓冲区、窗口和字典
set timeoutlen=500    " 按键等待时间
set formatoptions-=o  " o 换行行首不跟注释符
set nocompatible      " 取消兼容 vi

" -------------------------- 其他设置 --------------------------


let vimDir = '$HOME/.vim'
if stridx(&runtimepath, expand(vimDir)) == -1
    " 如果 vimDir 不在 runtimepath 则添加
    let &runtimepath.=','.vimDir
endif


" 持久化撤销历史记录
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif


let g:python_host_prog  = $HOME . '/.pyenv/shims/python'
let g:python3_host_prog = $HOME . '/.pyenv/shims/python'


" 判断是否为 Windows WSL 环境
let g:is_wsl = 0
if has("unix")
    if filereadable("/proc/version")
        let lines = readfile("/proc/version")
        if lines[0] =~ "Microsoft"
            let g:is_wsl = 1
        endif
    endif
endif


" 判断是否为 ssh 会话
let g:is_ssh = 0
if trim(system("echo $SSH_CLIENT")) != "" || trim(system("echo $SSH_CONNECTION")) != ""
    let g:is_ssh = 1
endif


if g:is_wsl == 1
    let g:clipboard = {
                \   'name': 'wslclipboard',
                \   'copy': {
                \      '+': '/mnt/d/winbin/win32yank.exe -i --crlf',
                \      '*': '/mnt/d/winbin/win32yank.exe -i --crlf',
                \    },
                \   'paste': {
                \      '+': '/mnt/d/winbin/win32yank.exe -o --lf',
                \      '*': '/mnt/d/winbin/win32yank.exe -o --lf',
                \   },
                \   'cache_enabled': 1,
                \ }
endif
