let s:check_variable = exists("memo_preview")

function! memo#memo_start() abort
   let s:current_dir = getcwd()

   execute 'cd' g:memo_saved_dir

   if g:memo_preview
      execute 'new' 
   else
      execute 'vnew'
   endif
endfunction

function! memo#memo_create(file) abort
   let l:file_name = a:file

   if a:file == 'date' 
      let l:file_name = strftime("%Y-%m-%d")
   endif

   let g:memo_create_path = g:memo_saved_dir . "/" . l:file_name . ".md"


   if g:memo_preview
      execute 'sp'  g:memo_create_path
   else
      execute 'vs' g:memo_create_path 
   endif

   if !filereadable(g:memo_create_path)
      execute "normal! i# " . l:file_name . "\<cr>\<cr>"
      :startinsert
   endif
endfunction


function! memo#memo_list() abort
   if g:memo_preview
      execute 'sp' g:memo_saved_dir
   else
      execute 'vs' g:memo_saved_dir
   endif
endfunction
