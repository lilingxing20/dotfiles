""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       基础配置                                       "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 高亮
set nocompatible               " 关闭与vi的兼容模式
syntax on                      " 语法高亮
set number                     " 显示行号
set cul                        " 高亮光标所在行
"set cuc                        " 高亮光标所在列
"set cursorline                 " 突出显示当前行
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"set cursorcolumn               " 高亮光标所在列
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
set wrap                     " wrap/nowrap 是/否 自动折行


" 插入模式下不需要光棒
autocmd InsertEnter * setlocal nocursorline
autocmd InsertLeave * setlocal cursorline
autocmd InsertEnter * setlocal nocursorcolumn
autocmd InsertLeave * setlocal cursorcolumn


" 只有当前窗口才显示光棒
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorcolumn
autocmd WinLeave * setlocal nocursorcolumn


" 状态栏
set ruler                  " 打开状态栏标尺
set showcmd                " 在状态栏显示正在输入的命令
set wildmenu               " 打开命令行补全菜单（出现在状态栏上）
set cmdheight=1            " 设定命令行的行数为 1
set laststatus=2           " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\      " 设置在状态行显示的信息
set guioptions-=T               " 隐藏工具栏
set guioptions-=m               " 隐藏菜单栏
set showtabline=1               " 只有当存在多个标签页时，才显示标签行
set magic                       " 设置魔术
set hidden                      " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存


" 格式对齐
set shiftwidth=4                    " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4                   " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4                       " 设定 tab 长度为 4
set expandtab                       " 实现按TAB产生4个空格
set smarttab                        " 在行和段开始处使用制表符
set smartindent                     " 开启新行时使用智能自动缩进
"set cindent                        " C 语法格式的自动缩进
"set autoindent                     " 自动缩进
set completeopt=preview,menu        " 代码补全
" set showmatch                       " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2                     " 短暂跳转到匹配括号的时间
set backspace=indent,eol,start      " 用退格键可以删除自动缩进、换行符、越过编辑起始点

" Python 文件的一般设置，比如不要 tab 等
"autocmd FileType python set tabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix textwidth=99
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix
" 有些情况下 tab=2 效果更佳
autocmd FileType haskell,lhaskell,yaml,json setlocal shiftwidth=2 tabstop=2 softtabstop=2

" 代码风格 PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4               " 设定tab宽度 4 个空格
    \ set softtabstop=4           " 按退格键一次删除 4 个空格 
    \ set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
    \ set textwidth=79            " 设定行最大宽度
    \ set expandtab               " 按Tab替换为空格键
"    \ set autoindent              " 自动缩进
"    \ set fileformat=unix         " 保存文件格式
    

" 搜索
set ignorecase smartcase        " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan                  " 禁止在搜索到文件两端时重新搜索
set incsearch                   " 输入搜索内容时就显示搜索结果
set hlsearch                    " 搜索时高亮显示被找到的文本


" 折叠
"
" set foldmethod <>
"   - manual  # 手工定义折叠
"   - indent  # 用缩进表示折叠
"   - expr　  # 用表达式来定义折叠
"   - syntax  # 用语法高亮来定义折叠
"   - diff    # 对没有更改的文本进行折叠
"   - marker  # 用标志折叠
"
" indent:
"   - zc           # 折叠
"   - zC           # 对所在范围内所有嵌套的折叠点进行折叠
"   - zo           # 展开折叠
"   - zO           # 对所在范围内所有嵌套的折叠点展开
"   - [z           # 到当前打开的折叠的开始处。
"   - ]z           # 到当前打开的折叠的末尾处。
"   - zj           # 向下移动。到达下一个折叠的开始处。关闭的折叠也被计入。
"   - zk           # 向上移动到前一折叠的结束处。关闭的折叠也被计入。
"   - za (toggle)  # 转换函数的折叠状态，打开的函数会被折叠，折叠的函数会被打开
"   - zR (reduce)  # 打开所有的折叠函数
"   - zM (more)    # 折叠所有的函数​
"
" set foldenable               " 开始折叠
set foldmethod=indent        " 用缩进表示折叠
" set foldnestmax=2          " 最多折叠两层（一层函数，一层大流程控制），多了用处不大
" set foldcolumn=0           " 设置折叠区域的宽度
set foldlevel=1              " 设置折叠层数为
" set foldclose=all          " 设置为自动关闭折叠
set nofoldenable           " 缺省不折叠  
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>    " 用空格键来开关折叠，zc/zo=za
"
" 使用zc按键来创建折叠，使用za来打开或者关闭折叠。za经常会误输入，可以用空格键来替代za
" nnoremap <space> za


" 设置文件编码类型                                                                                          
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese,cp936
"set fileencodings=utf-8,cp936,gb2312,gb18030,gbk,big5,euc-cn,euc-jp


" 窗口分割
" vim在编辑的时候就可以打开多个文件：
" :vs 或者 :vsplit  将当前窗口竖直分割，并在上面新窗口中显示当前文件
" :sp 或者 :sv 或者 :split  将当前窗口水平分割，并在左边新窗口中显示当前文件
" :vs filename 将当前窗口竖直分割，新文件在新窗口中显示
" :sp filename 将当前窗口竖直分割，新文件在左边新窗口中显示
" :new 新建文件并竖直分割
" :vnew 新建文件并水平分割
"
" 让新窗口在右边或者下方打开
set splitbelow
set splitright
"
" 窗口切换
" Ctrl-w-j 切换到下方的分割窗口
" Ctrl-w-k 切换到上方的分割窗口
" Ctrl-w-l 切换到右侧的分割窗口
" Ctrl-w-h 切换到左侧的分割窗口
" 觉得三个按键多的话可以设置快捷键：
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"nnoremap <C-h> <C-w>h
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l

" Normal 模式下用 TAB 键切换当前窗口。
nmap <silent> <TAB>     <C-W>w
nmap <silent> <S-TAB>   <C-W>p

" Visual 模式下用 TAB 来缩进代码
vmap <silent> <TAB>     >gv
vmap <silent> <S-TAB>   <gv

" 用上下左右键来调整窗口大小
nmap <silent> <Left>  <C-W><:unlet! t:flwwinlayout<CR>
nmap <silent> <Right> <C-W>>:unlet! t:flwwinlayout<CR>
nmap <silent> <Up>    <C-W>+:unlet! t:flwwinlayout<CR>
nmap <silent> <Down>  <C-W>-:unlet! t:flwwinlayout<CR>

" 交换两个窗口，这个不太常用
nmap <F7> <C-W>x

" Q 不保存退出，X 保存退出
nmap Q :q!<CR>
nmap X :x<CR>

" 其他
set pastetoggle=<F6>       " 按原有格式粘贴
set scrolloff=5            " 光标移动距离屏幕顶部或底部 10 行时，开始滚动
set autochdir              " 自动切换当前目录为当前文件所在的目录
set nobackup               " 覆盖文件时不备份
set backupcopy=yes         " 设置备份时的行为为覆盖
set noerrorbells           " 关闭错误信息响铃
set novisualbell           " 关闭使用可视响铃代替呼叫
set t_vb=                  " 置空错误铃声的终端代码


" 仅在 Normal 模式和 Visual 模式下才可以用鼠标
" 这意味着要想用鼠标复制到剪切板的话，只需要按
" i 进入插入模式，或者按 : 进入命令行模式就可以了。
"set mouse=nv
set mouse=i

" 为 20 个文件保存位置标记（书签），
" 每个寄存器最多保存 50 行内容，且大小不能超过 10k
" 另外，打开文件时，不高亮显示上次关闭前搜索过的字符串
set viminfo='20,<50,s10,h

" 按快捷键添加以下内容
"nmap <C-I> i#!/usr/bin/env perl<ENTER><ENTER>use strict;<ENTER>use warnings;<ENTER><ENTER>
nmap <F4> oimport pdb;pdb.set_trace()<ENTER>

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" Q 不保存退出，X 保存退出
nmap Q :q!<CR>
nmap X :x<CR>

"恢复上次打开的光标位置
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal `\"" | endif
"autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif


" gF 在新窗口打开光标下的文件名
nmap gF <C-W>f
" 对于 vim 7.x 来说，可以让文件在新标签页打开
if version >= 700
    nmap <silent> gf <C-W>gf:tabmove<CR>
endif


" Dieken 的功能，列出所用查找的行到新窗口
" nnoremap <F2> :g//laddexpr expand("%") . ":" . line(".") . ":" . getline(".")<CR>:lopen<CR>
" nnoremap <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR><CR>

" Visual 模式下用 c 和 C 来注释、取消注释代码
vmap <silent> c :<BS><BS><BS><BS><BS>let FlwSearchBak=@/\|'<,'>s/^/#/gi\|call histdel("search", -1)\|let @/ = FlwSearchBak<CR>
vmap <silent> C :<BS><BS><BS><BS><BS>let FlwSearchBak=@/\|'<,'>s/^#//gi\|call histdel("search", -1)\|let @/ = FlwSearchBak<CR>
"vmap c :s/^/#/gi<Enter>
"vmap C :s/^#//gi<Enter>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                按F12编译运行                                         "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nmap <F12> :!./%<ENTER>
" autocmd FileType python map <F12> :!time python %<CR>
map <F12> :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        exec "!time python3 %"
    endif
endfunc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        新建.sh,.py文件，自动插入文件头                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
autocmd BufNewFile *.sh,*.py exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
  "如果文件类型为.sh文件
  if &filetype == 'sh'
    call setline(1,"\#!/bin/bash")
    call append(line("."), "")
  elseif &filetype == 'python'
    call setline(1,"#!/usr/bin/env python")
    call append(line("."),"# -*- coding:utf-8 -*-")
    call append(line(".")+1, "")
    call append(line(".")+2, "'''")
"    call append(line(".")+3, "\Author      : lixx (https://github.com/lilingxing20)")
    call append(line(".")+3, "\Author      : lixx")
    call append(line(".")+4, "\Created Time: ".strftime("%c"))
    call append(line(".")+5, "\File Name   : ".expand("%"))
    call append(line(".")+6, "\Description : ")
    call append(line(".")+7, "'''")
    call append(line(".")+8, "")
  endif
endfunc
"新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    颜色设置                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"filetype plugin on
" 0 黑色 1 红色 2 墨绿 3 黄色 4 难看刺眼的颜色，即默认的颜色 5 类似粉色的 6 淡蓝色 7 白色
highlight comment ctermfg=6
highlight DiffAdd cterm=bold ctermfg=green ctermbg=17
highlight DiffDelete cterm=bold ctermfg=blue ctermbg=17
highlight DiffChange cterm=bold ctermfg=yellow ctermbg=17
highlight DiffText cterm=bold ctermfg=red ctermbg=88
"highlight DiffAdd cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
"highlight DiffText cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
"if has("gui_running")
"    colorscheme darkblue
"    hi Visual                       guibg=Yellow
"    hi Folded       guifg=#CCCCCC   guibg=#900090
"    hi FoldColumn   guifg=#CCCCCC   guibg=#900090
"    hi DiffText                     guibg=Yellow
"        hi DiffText                     guibg=#CC0000
"else
"    colorscheme flwcolor
"    colorscheme darkblue
"endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                       插件管理开始                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ## 插件说明
" vim插件中最主要的就是vundle了，vundle用来管理vim的其它插件
" ## Vundle
" Vundle 是 Vim bundle 的简称,使用git来管理vim插件，有了它，安装其它插件就方便很多
" 项目地址: https://github.com/VundleVim/Vundle.vim
" mkdir -p ~/.vim/bundle/
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" ## 安装方法
" 如果想下载某个插件，比如自动缩进indentpython.vim插件，需要将
" Plugin 'vim-scripts/indentpython.vim'
" 置于call vundle#begin()和call vundle#end()之间，保存配置后在vim中执行
" :PluginInstall
" 即可以自动下载indentpython.vim插件了。

" 配置到.vimrc开头
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" 自动缩进: 安装indentpython.vim插件
Plugin 'vim-scripts/indentpython.vim'

" 语法检查: 安装 syntastic 插件，每次保存文件时 Vim 都会检查代码的语法
Plugin 'vim-syntastic/syntastic'

" 添加flake8代码风格检查
Plugin 'nvie/vim-flake8'
" 运行F7就可以进行flake8检查了

" 配色方案1: solarized 配色方案已经流行很久了，github 地址: https://github.com/altercation/vim-colors-solarized
Plugin 'altercation/vim-colors-solarized'

" 配色方案2: Zenburn
Plugin 'jnurmine/Zenburn'

" 树形目录
Plugin 'scrooloose/nerdtree'
" 为nerdtree添加git支持：
Plugin 'Xuyuanp/nerdtree-git-plugin'
" 如果你想用tab键：
Plugin 'jistr/vim-nerdtree-tabs'

" 美化状态栏，可以显示当前的虚拟环境、Git分支、正在编辑的文件等信息
Plugin 'Lokaltog/vim-powerline'

" 缩进指示线
Plugin 'Yggdroot/indentLine'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 语法检查 syntastic
let g:syntastic_python_checkers = ['pylint', 'flake8']
let g:syntastic_python_python_exec = 'python'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" 设置error和warning的标志
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol='E'
let g:syntastic_warning_symbol='W'
"no-unused-args 忽略不使用的参数
"no-redefined 忽略重定义
"no-max-line-length 忽略每行最长的检测

" 配色方案: solarized有dark和light两种配色
"syntax enable
"set background=dark  " light or dark
"colorscheme Zenburn  " solarized/Zenburn
"
" 也可以根据gui模式和终端模式进行切换：
"if has('gui_running')
"    set background=light
"else
"    set background=dark
"endif
"
" 两种配色切换：
"if has('gui_running')
"  set background=dark
"  "colorscheme solarized
"else
"  colorscheme Zenburn
"endif

" 树形目录配置
" 添加开关树形目录的快捷键：
map <C-n> :NERDTreeToggle<CR>
" Ctrl+n就可以开启目录了。
" 设置忽略.pyc文件：
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
" 为nerdtree添加git支持：
" Plugin 'Xuyuanp/nerdtree-git-plugin'
" 如果你想用tab键：
" Plugin 'jistr/vim-nerdtree-tabs'


" 缩进指示线开关
" https://gitcode.com/yggdroot/indentline/overview?utm_source=csdn_github_accelerator&isLogin=1
map <C-i> :IndentLinesToggle<CR>
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_char = '¦'                         " 设置对齐线的字符
let g:indentLine_first_char = '-'                   " 设置对齐线的首字符
let g:indentLine_showFirstIndentLevel = 1           " 显示对齐线首字符
let g:indentLine_color_term = 239 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    插件管理结束                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" # vim: tabstop=4 shiftwidth=4 softtabstop=4
