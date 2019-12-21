"在插入模式下，将jj键映射为<esc>键
imap jj <esc><right>
imap JJ <esc><right>
imap jJ <esc><right>
imap Jj <esc><right>

map <leader>w <c-w><c-w>
"=========================================
"% 表示相对路径文件名，比如在~目录下执行了命令vim ./vim/config/mapping.vim，那么%='./vim/config/mapping.vim'
"%:e 表示取文件名后缀 vim
"%:r 表示去掉后缀之后的路径 ./vim/config/mapping
"%:t 表示去掉路径之后的文件名 mapping.vim
"%:t:r 表示取去掉路径和后缀名之后的文件名 mapping
"可以用 :!echo %来查看效果

"exec 表示执行命令，如果命令以"!"开头， 那么表示在shell中执行命令
"=========================================

"映射<F5>为运行快捷键
map <F5> :call CompileRunGcc()<CR>
function! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "! g++ -std=c++11 -g % -o %<"
		exec "! time ./%<"
	elseif &filetype == 'cpp'
		exec "! g++ -std=c++11 -g % -o %<"
		exec "! time ./%<"
	elseif &filetype == 'python'
		exec "! time python %"
	elseif &filetype == 'java'
		exec "! javac %"
		exec "! time java %<"
	elseif &filetype == 'sh'
		exec "! time bash %"
		" :!time bash %
	endif
endfunction




"=========================================以下按键映射只有在mac osx下才有用=========================================

function! Open()
	exec "w"
	exec "! open -a /Applications/'Sublime Text.app' %"
endfunction

if executable("open")
	map <leader>o :call Open()<CR>
endif

" 在visual模式下， 使用"+y把内容复制到外部剪贴板
if executable("pbcopy")
	vmap "+y :w !pbcopy<CR><CR>
endif

" 在normal模式下， 使用"+p将外部剪贴板的内容复制到vim
if executable("pbpaste")
	nmap "+p :r !pbpaste<CR><CR>
endif
