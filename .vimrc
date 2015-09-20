"字符编码"｀
"vim编码设置为utf-8，支持中文输入"
set fileencodings=utf-8,ucs-bom,gbk,gb2313,gb18030,cp936,latin1
set encoding=utf-8
set langmenu=zh_CN,utf-8

""映射快捷键开始命令为" ,"号
let g:mapleader= ","

"语法和缩进"
"设定vim与vi不兼容"
set nocompatible
"自动缩进，即为新行自动添加与当前行同等的缩进"
:set autoindent
"类似C语言程序的缩进"
set cindent
set showmatch
"检索时忽略大小写"
set ignorecase
set hlsearch
"显示行号"
set nu

"tab相关设置"
"开启时，在行首按TAB将加入shiftwidth个空格，否则加入tabstop个空格"
set smarttab
"是将输入的TAB自动展开成空格。开启时要输入TAB，需要Ctrl-V<TAB>"
set expandtab
set tabstop=4
"设定<<和>>命令移动时的宽度为４"
set shiftwidth=4

"为方便复制，用<F2>开启／关闭行号显示
nnoremap <F2> :set nonumber!<CR>

"颜色方案"
set t_Co=256
"使用molokai配色方案"
colorscheme molokai
"为光标所在行加下划线，molokai配色下为高亮一行"
set cursorline
"语法高亮"
syntax on

"设置自动格式化 解决复制代码过来的时候出现格式混乱
""shift +v 开头 
"shift +g 结尾
""==
"格式化全文： gg=G

"设置括号配对情况
set showmatch
set matchtime=2

"Code folding
""set foldmethod=syntax
"代码块折叠
"autocmd FileType python set foldmethod=indent
""autocmd FileType xml set foldmethod=indent
"autocmd FileType dia set foldmethod=indent

"括号自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
 inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap < <><ESC>i
":inoremap > <c-r>=ClosePair('>')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i
 
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

"插件
"侦测文件类型
filetype on
"载入插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype indent on

"配置vundle"
set nocompatible " be iMproved
"filetype off     " required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"安装插件”
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'bling/vim-airline'

"命令
"BundleList查看插件列表
"BundleInstall安装插件
"BundleClean删除对应行后，执行，清理插件
"BundleSearch查找插件

""NERDTree：智能文件管理
"nerdtree setting
let NERDChristmasTree=1     " 类似圣诞树的显示方式
let NERDTreeAutoCenter=1    " 控制当光标移动超过一定距离时，是否自动将焦点调整到屏中心
let NERDTreeBookmarksFile=$VIMFILES.'\NERDTree_bookmarks'   " 指定书签文件
let NERDTreeMouseMode=2     " 指定鼠标模式(1.双击打开 2.单目录双文件 3.单击打开)
let NERDTreeShowBookmarks=1 " 是否默认显示书签列表
let NERDTreeShowFiles=1     " 是否默认显示文件
let NERDTreeShowHidden=1    " 是否默认显示隐藏文件
let NERDTreeShowLineNumbers=0   " 是否默认显示行号
let NERDTreeWinPos='left'   " 窗口位置（'left' or 'right'）
let NERDTreeWinSize=31      " 窗口宽度
let NERDTreeQuitOnOpen = 1  " 当通过NERD Tree打开文件自动退出NERDTree界面
"ctrl+n to open nerdtree
nmap <C-n> :NERDTree<CR>

 
"NERD_commenter：注释代码
"以下为插件默认快捷键
    "<leader>ca   ->在可选的注释方式之间切换，比如C/C++ 的块注释/* */和行注释//
    "<leader>cc   ->注释当前行
    "<leader>cs   ->以”性感”的方式注释
    "<leader>cA   ->在当前行尾添加注释符，并进入Insert模式
    "<leader>cu   ->取消注释
    "<leader>cm   ->添加块注释

"tagbar setting
"F9
nmap <C-T> :TagbarToggle<CR>
let g:tagbar_width = 20
"auto run tagbar when use vim
"autocmd VimEnter * nested :call tagbar#autoopen(1)
""tagbar window postion
let g:tagbar_right = 1
"let g:tagbar_left = 1"""
"启动自动focus
let g:tagbar_autofocus = 1

"airline setting
""开启airline
set laststatus=2
"不检测行尾空格,trailing-white-space
let g:airline#extensions#whitespace#enabled = 0
""使用tab打开文件
"let g:airline#extensions#tabline#enabled = 1
""let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'''"''""""""

"YouCompleteMe
"设置error和warning的提示符，如果没有设置，ycm会以syntastic的
"g:syntastic_warning_symbol和g:syntastic_error_symbol这两个为准
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
"设置跳转的快捷键，可以跳转到definition和declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nmap <F4> :YcmDiags<CR>
"设置全局配置文件的路径
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
"开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
"在接受补全后不分裂依哥窗口显示接受的项
set completeopt-=preview
"不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
"每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
""在注释中也可以补全
let g:ycm_complete_in_comments=1
"输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
""不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=0


