let g:easy_align_ignore_groups = ['String']
let g:easy_align_delimiters = {
\ '>': { 'pattern': '>>\|=>\|>\|->' },
\ '/': {
\     'pattern':         '//\+\|/\*\|\*/',
\     'delimiter_align': 'l',
\     'ignore_groups':   ['!Comment'] 
\    },
\ '-' : { 'pattern': '\-\-', 'left_margin': 0, 'right_margin': 0 }
\ }


" NOTE: 预定义的间隔符号如下
" <Space> = : . | & # ,


" DEMO: 假设间隔符号为 ?
" ? Around the 1st occurrences
" 2? Around the 2nd occurrences
" *? Around all occurrences
" -? Around the last occurrences
" **? Left/Right alternating alignment around all occurrences
" <Enter> Switching between left/right/center alignment modes
"
" link: https://raw.githubusercontent.com/junegunn/i/master/easy-align/equals.gif


" Lorem=ipsum
" dolor =sit
" amet+=
" consectetur==adipiscing
" elit-=sed !do
" eiusmod=tempor=incididunt
" ut &&labore
