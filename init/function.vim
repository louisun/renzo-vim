" Usage: ssh -R 2048:localhost:2048 user@host
" NOTE: Windows 下后台运行服务方式：Start-Process -FilePath "rz-daily-server.exe" -WindowStyle Hidden

" 获取远程剪贴板
function! GetRemoteClipboard()
  let url = 'http://localhost:2048/api/clipboard/get'
  let response = system('curl -s ' . shellescape(url))
  if v:shell_error
    echo "Some error happened. Is your server running?"
    return
  endif
  let data = json_decode(response)
  let @* = data.content
endfunction

" 设置远程剪贴板
function! SendToRemoteClipboard()
  let url = 'http://localhost:2048/api/clipboard/set'
  let content = @*
  let data = {'content': content}
  let json_data = json_encode(data)
  let response = system('curl -s -X POST -H "Content-Type: application/json" -d ' . shellescape(json_data) . ' ' . shellescape(url))
  if v:shell_error
    echo "Some error happened. Is your server running?"
    return
  endif
  echo response
endfunction

" 判断复制到下一行还是当前行
function! PasteSystemOnCondition()
  if getline('.') =~ '^\s*$'
    normal! "*p
  else
    normal! o
    normal! "*p
  endif
endfunction

" 打开 vim-map-viewer 查当前 map 文件
function! OpenVimMapViewer(filepath)
  let s:map_table = system("vim-map-viewer --file " . a:filepath)
  new
  wincmd K
  call append(0, split(s:map_table, "\n"))
  normal! gg
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal nomodifiable
  setlocal nobuflisted
  setlocal syntax=help
endfunction

" 将当前主题颜色写入配置文件
function! WriteCurrentColorSchemeToFile()
  call writefile(['colorscheme ' . g:colors_name], g:home . '/init/colorscheme-custom.vim')
endfunction


function! ConfirmQuit()
  if tabpagenr('$') == 1 && winnr('$') == 1
    let choice = confirm("确认退出 Vim?", "&Yes\n&Quit\n&No", 1)
    if choice == 1 || choice == 2
      quit
    endif
  else
    quit
  endif
endfunction

" 保存当前选中的内容到寄存器 @/，这里 cmdtype 为 '/' 就是进行转义 '\/'
function! s:get_selection(cmdtype)
  let temp = @s
  normal! gv"sy
  let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
  let @s = temp
endfunction
