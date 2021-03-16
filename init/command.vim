if exists('g:local_command')
  finish
endif

" install vim plugin: source vim config and install plugin
function! s:install_plugin()
	execute 'source '.$MYVIMRC
	execute 'PlugInstall'
	echo '[VIM PLUG] Install Plugin Finished.'
endfunction

command! -nargs=0 UP call s:install_plugin()

let g:local_command=1
