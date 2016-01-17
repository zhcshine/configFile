" 使用说明
" 这是linux 环境下的vim 配置文件
" 在linux 环境下下载插件管理工具
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
"
"
"
"
" Vundle插件基础配置
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
Plugin 'altercation/vim-colors-solarized'  " 配色模板
Plugin 'Lokaltog/vim-powerline' " 全局状态/提示栏
Plugin 'nathanaelkane/vim-indent-guides'  " 高亮显示行首缩进
Plugin 'scrooloose/nerdcommenter' " 代码注释插件
Plugin 'scrooloose/nerdtree' " 目录结构
Plugin 'fholgado/minibufexpl.vim' " 快速浏览和操作Buffer
Plugin 'vim-scripts/VimIM' " 基于Vim的嵌入式中文输入法
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" """"""""""""""""""""""""" 基本设置 """"""""""""""""""""""

" 定义快捷键的前缀，即<Leader>
let mapleader=";"
" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu
" 高亮显示搜索结果
set hlsearch

" """"""""""""""""""""""" 界面设置 """"""""""""""""""""""""
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
if has('gui_running')
    set background=light
    colorscheme solarized
    set guifont=DejaVu\ Sans\ mono\ 11
else
    set background=dark
endif
set linespace=6 " 调整行间距(只有gui才有效果)
" 禁止光标闪烁
set gcr=a:block-blinkon0
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 开启行号显示
set number
" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline
" set cursorcolumn
" 禁止折行
set nowrap
" 总是显示状态栏
set laststatus=2
let g:Powerline_symbols = 'fancy'

" """""""""""""""""""""" 编辑样式 """"""""""""""""""""""
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 显示 TAB 键
set list
" TAB会被显示成 ">—" 而行尾多余的空白字符显示成 "-"
set listchars=tab:>-,trail:-
" 显示行尾的空格
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" 配置行首缩进高亮 nathanaelkane/vim-indent-guides 插件 快捷键<Leader>ig
let g:indent_guides_guide_size=1 " 宽度为1
let g:indent_guides_enable_on_vim_startup = 1  " 自动加载
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" 代码折叠
" 操作：za，打开或关闭当前折叠；zM，关闭所有折叠；zR，打开所有折叠。
" 基于缩进或语法进行代码折叠
set foldmethod=indent
" set foldmethod=syntax
" set foldlevel=100  " 启动vim时不要自动折叠代码
set foldlevel=1 " 启动vim时自动折叠代码

" 代码注释 scrooloose/nerdcommenter
" 1、 <Leader>cc注释当前行和选中行
" 2、 <Leader>cn没有发现和\cc有区别
" 3、 <Leader>c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作
" 4、 <Leader>cm对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释
" 5、 <Leader>ci执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释
" 6、 <Leader>cs 添加性感的注释，代码开头介绍部分通常使用该注释
" 7、 <Leader>cy 添加注释，并复制被添加注释的部分
" 8、 <Leader>c$注释当前光标到改行结尾的内容
" 9、 <Leader>cA跳转到该行结尾添加注释，并进入编辑模式
" 10、<Leader>ca 转换注释的方式，比如： /**/和//
" 11、<Leader>cl <Leader>cb 左对齐和左右对其，左右对其主要针对/**/
" 12、<Leader>cu取消注释

" 目录结构 NERDTre
" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" autocmd VimEnter * NERDTree
" 按下 F2 调出/隐藏 NERDTree
nmap <F2> :NERDTreeToggle<CR>
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
" let NERDTreeShowBookmarks=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 目录结构 NERDTre快捷键
" ctrl + w + h    光标 focus 左侧树形目录
" ctrl + w + l    光标 focus 右侧文件显示窗口
" ctrl + w + w    光标自动在左右侧窗口切换
" ctrl + w + r    移动当前窗口的布局位置
" o       在已有窗口中打开文件、目录或书签，并跳到该窗口
" go      在已有窗口 中打开文件、目录或书签，但不跳到该窗口
" t       在新 Tab 中打开选中文件/书签，并跳到新 Tab
" T       在新 Tab 中打开选中文件/书签，但不跳到新 Tab
" i       split 一个新窗口打开选中文件，并跳到该窗口
" gi      split 一个新窗口打开选中文件，但不跳到该窗口
" s       vsplit 一个新窗口打开选中文件，并跳到该窗口
" gs      vsplit 一个新 窗口打开选中文件，但不跳到该窗口
" !       执行当前文件
" O       递归打开选中 结点下的所有目录
" x       合拢选中结点的父目录
" X       递归 合拢选中结点下的所有目录
" e       Edit the current dif
" 双击    相当于 NERDTree-o
" 中键    对文件相当于 NERDTree-i，对目录相当于 NERDTree-e
" D       删除当前书签
" P       跳到根结点
" p       跳到父结点
" K       跳到当前目录下同级的第一个结点
" J       跳到当前目录下同级的最后一个结点
" k       跳到当前目录下同级的前一个结点
" j       跳到当前目录下同级的后一个结点
" C       将选中目录或选中文件的父目录设为根结点
" u       将当前根结点的父目录设为根目录，并变成合拢原根结点
" U       将当前根结点的父目录设为根目录，但保持展开原根结点
" r       递归刷新选中目录
" R       递归刷新根结点
" m       显示文件系统菜单
" cd      将 CWD 设为选中目录
" I       切换是否显示隐藏文件
" f       切换是否使用文件过滤器
" F       切换是否显示文件
" B       切换是否显示书签
" q       关闭 NerdTree 窗口
" ?       切换是否显示 Quick Help

" 快速浏览和操作Buffer -- 插件: MiniBufExplorer
" :bn   打开当前buffer的下一个buffer
" :bp   打开当前buffer的前一个buffer
" :b"num"   打开指定的buffer，"num"指的是buffer开始的那个数字，:b1 :b2等
" :ls    当前打开的buffer
" :bd    删除buffer

" 中文输入法  --  插件: VimIM
" 快捷键  gi 直接输入
" 或者输入后按Ctrl+^ 弹出选择菜单