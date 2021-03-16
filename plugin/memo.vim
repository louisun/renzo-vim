let g:memo_saved_dir = '/Users/louisun/Documents/TmpNotes/' " memo 目录
let g:memo_preview = 0                                      " 垂直模式

if exists('g:loaded_memo')
   finish
endif

let g:loaded_memo = 1

command! Memo call memo#memo_start()

command! MemoList call memo#memo_list()

command! -nargs=1 MemoCreate call memo#memo_create(<q-args>)
