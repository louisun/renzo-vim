let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

command! -nargs=1 LoadFile exec 'source '.s:home.'/'.'<args>'

" option
LoadFile init/init.vim

" map
LoadFile init/mapping.vim

" plug
LoadFile init/pluglist.vim

" theme
LoadFile init/theme.vim

" command
LoadFile init/command.vim
