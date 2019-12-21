" vim8发布有一年了，有没有基于vim8新特性开发的黑科技插件？ - 张翼腾的回答 - 知乎
" https://www.zhihu.com/question/68164923/answer/399729292

let g:rep_row_width = 10                    " 窗口宽度
let g:sendtorepl_invoke_key = "ww"          " 传送代码快捷键，默认为ww
let g:repl_at_top = 0                       " 0表示出现在下方，1表示出现在下方
let g:repl_stayatrepl_when_open = 0         " 打开REPL时是回到原文件（1）还是停留在REPL窗口中（0）

map <F12> :REPLToggle<CR>
