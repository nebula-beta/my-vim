set nocompatible 							"关闭vi兼容模式
syntax on									"开启语法高亮
" colorscheme molokai							"设置vim主题
" colorscheme zenburn
" colorscheme dream
" colorscheme dream-light
set encoding=utf-8							"设置vim保存时使用的编码
set backspace=indent,eol,start				"使得退格键能够删除字符 
set mouse=a

set tabstop=4								"设置tab键长度为4个空格
set softtabstop=4
set shiftwidth=4							"设置<*和>*命令移动时的宽度

set autoindent								"使用o或者O新起一行时会复制上或下一行的缩进
set smartindent								"开启智能缩进，比如遇到if，for换行时会帮你缩进

set number									"设置行号
set cursorline								"突显当前行
" set cursorcolumn							"突显当前列
set scrolloff=10							"光标上下移动时，光标的上方或下方至少会保留显示的行数

set incsearch								"输入搜索内容时就显示搜索结果
set hlsearch								"高亮所有被搜索到的文本, 搜索之后使用nohl取消高亮
"set nohlsearch
		
"set showmatch								" 插入括号时，短暂地跳转到匹配的对应括号
"set matchtime=2							"短暂跳转到匹配括号的时间
set showcmd									"在状态栏显示正在输入的命令
set ruler									"在状态栏显示行号和列号
set laststatus=2							"设置状态行的高度，默认为1，即不显示状态栏


set autoread								"文件被修改时自动载入

let mapleader = ","
let g:mapleader = ","

source ~/.vim/config/mapping.vim

"离开插入模式自动保存
autocmd InsertLeave * w
"当新建以下后缀结尾的文件是， 会拷贝模板文件中的代码到新建文件中
autocmd BufNewFile *.sh 		0r ~/.vim/templates/sh.template
autocmd BufNewFile *.py 		0r ~/.vim/templates/py.template
autocmd BufNewFile *.cpp 		0r ~/.vim/templates/cpp.template



"自动修改python脚本文件的权限为可执行
"autocmd BufWritePost *.sh			silent !chmod +x <afile>
autocmd BufWritePost * if getline(1) =~ "^#!" | if getline(1) =~ "/bin/" | silent !chmod +x <afile>


"设置打开vim时，将光标显示在上次的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" -----------------------------------------------------------------------
" -----------------------------------------------------------------------
" -----------------------------------------------------------------------

" https://www.cnblogs.com/schips/p/10766599.html
" https://linux.cn/article-9751-1.html
" PlugStatus
" PlugInstall
" PlugUpdate
" PlugDiff
" PlugClean
" PlugUpgrade



" install plugins to dir ~/.vim/plugged
call plug#begin('~/.vim/plugged') 
Plug 'scrooloose/nerdtree'				" 目录树插件
Plug 'tpope/vim-commentary'				" 注释插件
Plug 'majutsushi/tagbar'				" 显示已定义的变量、函数和类
Plug 'davidhalter/jedi-vim'				" python补全, 支持第三方模块补全
" Plug 'Shougo/neocomplcache.vim'			" 补全，只为了其中的filename补全功能
Plug 'dense-analysis/ale'				" 异步语法检查
Plug 'kevinw/pyflakes-vim'				" python实时语法检查
Plug 'jiangmiao/auto-pairs'				" 括号自动补全
Plug 'sillybun/vim-repl'				" 在vim中打开python terminal
" Plug 'Valloric/YouCompleteMe'
" Plug 'python-mode/python-mode'


Plug 'terryma/vim-multiple-cursors'		" 多光标操作
Plug 'easymotion/vim-easymotion'		" 快速移动插件
Plug 'kien/ctrlp.vim'					" 文件搜索

Plug 'mhinz/vim-startify'				" 启动的时候显示一些编程相关的名言警句和最近打开文件
Plug 'vim-airline/vim-airline'			" 状态栏插件
Plug 'vim-airline/vim-airline-themes'	" 状态栏插件主题
Plug 'Yggdroot/indentLine'				" 缩进指示线
Plug 'tell-k/vim-autopep8'				" 按照pep8标准自动格式化
Plug 'fisadev/vim-isort'				" python import库排序


call plug#end()


" Code Faster in Python : https://kite.com/ 

" 插件配置
source ~/.vim/config/nerdtree.vim						" 目录树
source ~/.vim/config/vim-commentary.vim					" 批量注释/反注释插件
source ~/.vim/config/tagbar.vim							" 显示已定义的变量、函数和类
source ~/.vim/config/jedi.vim							" python补全
" source ~/.vim/config/neocomplcache.vim
source ~/.vim/config/pyflakes.vim
source ~/.vim/config/vim-repl.vim

source ~/.vim/config/vim-multiple-cursors.vim
source ~/.vim/config/vim-easymotion.vim

source ~/.vim/config/vim-airline.vim					" 状态栏美化
source ~/.vim/config/vim-airline-themes.vim				" 状态栏插件主题
source ~/.vim/config/indentline.vim						" python缩进指示线
source ~/.vim/config/vim-autopep8.vim					" 按照pepe8标准进行自动格式化
source ~/.vim/config/vim-isort.vim

" source ~/.vim/config/YouCompleteMe.vim

" 对python代码进行格式化，且对import库排序
" map <F8> :Autopep8<CR> :Isort<CR>


" 可能会发生的问题
" 1.升级到vim8 
" https://blog.csdn.net/yangk12321/article/details/80258436
" 2.vim8不支持python，导致jedi补全无法使用
" https://www.cnblogs.com/jkmiao/p/9655624.html
" 3.如果airline在tmux中的vim不能用
" 在你的bashrc或者zshrc中加入export TERM="xterm-256color"

" inoremap <s-tab> <c-x><c-f>



" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>



