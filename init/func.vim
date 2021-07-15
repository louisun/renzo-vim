" 判断是否为 Windows WSL 环境
function! Is_WSL()
  if has("unix")
    if filereadable("/proc/version")
      let lines = readfile("/proc/version")
      if lines[0] =~ "Microsoft"
        return 1
      endif
    endif
  endif

  return 0
endfunction
