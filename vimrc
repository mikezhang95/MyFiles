" 
" Specialized vimrc file
" By: Yuan Zhang
"

" 关闭声音
set noeb vb t_vb=


" 快捷键
" 定义快捷键的前缀，即<leader>
let mapleader=";"
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗
nnoremap <Leader>jw <C-W>j


" Insert模式下光标移动
" Alt + H            光标移当前行行首
imap ˙ <ESC>I
" Alt + J            光标移下一行行首
imap ∆ <ESC><Down>I
" Alt + K            光标移上一行行尾
imap ˚ <ESC><Up>A
" Alt + L            光标移当前行行尾
imap ¬ <ESC>A
" Ctrl  + H            光标左移一格
imap <c-h> <Left>
" Ctrl  + J            光标下移一格
imap <c-j> <Down>
" Ctrl  + K            光标上移一格
imap <c-k> <Up>
" Ctrl  + L            光标右移一格
imap <c-l> <Right>


" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin on
"" 让配置变更立即生效
"autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

" 辅助信息
" 显示行号
set number 
" 突出显示当前行
set cursorline 
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set laststatus=2
" 打开状态栏标尺
set ruler 
" 搜索时高亮显示被找到的文本
set hlsearch 


" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on


" 缩进
" 自适应不同语言的智能缩进
filetype indent on
" 将tab自动展开为空格"
set expandtab
" 设定 << 和 >> 命令移动时的宽度为 4
" 设定 tab 长度为 4
set tabstop=4 
set shiftwidth=4 
" 使得按退格键时可以一次删掉 4 个空格
set softtabstop=4
" 把当前行的对起格式应用到下一行； 
set autoindent 
" 开启新行时使用智能自动缩进
set smartindent 
"只在python文件将tab展开成空格"
"autocmd FileType python set expandtab"
" 退格键删除缩进和行
set backspace=indent,eol,start


" 折叠 
" 基于缩进或语法进行代码折叠
set foldmethod=indent
"set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
" 设置折叠区域的宽度
set foldcolumn=3
" 设置折叠层数为
set foldlevel=99



" vim-plug 环境设置
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'vim-scripts/phd'
Plug 'Lokaltog/vim-powerline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'derekwyatt/vim-fswitch'
Plug 'kshenoy/vim-signature'
Plug 'vim-scripts/BOOKMARKS--Mark-and-Highlight-Full-Lines'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/indexer.tar.gz'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/DrawIt'
Plug 'SirVer/ultisnips'
Plug 'derekwyatt/vim-protodef'
Plug 'scrooloose/nerdtree'
Plug 'fholgado/minibufexpl.vim'
Plug 'gcmt/wildfire.vim'
Plug 'sjl/gundo.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'mzlogin/vim-markdown-toc'
Plug 'jayli/vim-easycomplete'
" 插件列表结束
call plug#end()


" 设定配色方案
"set background=dark
"colorscheme slate
colorscheme molokai
"colorscheme phd

" === 书签：vim-signature快捷键 ===
let g:SignatureMap = {
        \ 'PlaceNextMark'      :  "m+",
        \ 'Purge<arksAtLine'   :  "m-",
        \ 'PurgeMarks'         :  "mda",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'ListBufferMarks'    :  "m/"
        \ }


" 查找/替换暂时使用原生...


" === F6 run program ===
map <F6> :call CompileRunGcc()<CR>
func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'cpp'
                exec "!g++ % -o %<"
                exec "!time ./%<"
        elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java %<"
        elseif &filetype == 'sh'
                :!time bash %
        elseif &filetype == 'python'
                exec "!clear"
                exec "!time python %"
        elseif &filetype == 'html'
                exec "!open -a \"Google Chrome\" %"
        elseif &filetype == 'go'
                " exec "!go build %<"
                exec "!time go run %"
        elseif &filetype == 'markdown'
                exec "!open -a \"Google Chrome\" %"
        endif
endfunc

" === easycomplete ===
let g:easycomplete_tab_trigger="<tab>"

" === NERDTree ===
nnoremap <space> za
map <F4> :NERDTreeToggle<CR>
" 设置宽度
let NERDTreeWinSize=25
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 显示/隐藏 MiniBufExplorer 窗口 
map <F3> :MBEToggle<CR>
" 自动打开
let g:miniBufExplAutoStart=1
" buffer 切换快捷键
map <leader>. :MBEbn<CR>
map <leader>, :MBEbp<CR>
map <leader>1 :1b<CR>
map <leader>2 :2b<CR>
map <leader>3 :3b<CR>
map <leader>4 :4b<CR>
map <leader>5 :5b<CR>

" === Leaderf ===
" github: https://github.com/Yggdroot/LeaderF
" blog: https://retzzz.github.io/dc9af5aa/ 
" 打开预览模式
let g:Lf_PreviewInPopup = 1
" 设置可以预览的类型
let g:Lf_PreviewResult = {'File':0, 'Buffer':0, 'Mru':0, 'Tag':0, 'BufTag':1, 'Function':1 , 'Line':1, 'Colorscheme':0, 'Rg':0, 'Gtags':0}

" 设置预览的水平位置
let g:Lf_PreviewHorizontalPosition = 'right'
" 设置window宽度
let g:Lf_WindowHeight= 0.25
" 设置预览的宽度
let g:Lf_PreviewPopupWidth = 0
" 提示快捷键
noremap <leader>fh :LeaderfSelf<cr>

" 查找文件 
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_RootMarkers = ['.git', '.svn', '.hg', '.project', '.root']

" 查找字符串 string
nmap <leader>fr <Plug>LeaderfRgPrompt 
nmap <leader>fs <Plug>LeaderfRgCwordLiteralNoBoundary
vmap <leader>fs <Plug>LeaderfRgVisualLiteralNoBoundary

" 查找gtags
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_GtagsSource = 1
nmap <leader>fgd <Plug>LeaderfGtagsDefinition
nmap <leader>fgr <Plug>LeaderfGtagsReference
vmap <leader>fgd <Plug>LeaderfGtagsDefinition
vmap <leader>fgr <Plug>LeaderfGtagsReference
noremap <leader>fgo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fgn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fgp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>


" 查找最近的文件
noremap <leader>fm :LeaderfMru<cr>
" 查找函数 
noremap <leader>fx :LeaderfFunction<cr>
" 查找buffer
noremap <leader>fb :LeaderfBuffer<cr>
" 查找buffer tag 
noremap <leader>ft :LeaderfBufTag<cr>
" 查找行
noremap <leader>fl :LeaderfLine<cr>


" === Vimdiff ===
if &diff
    let g:solarized_diffmode="high"
    map ] ]c
    map [ [c
    map <Leader>1 :diffget LOCAL<CR>
    map <Leader>2 :diffget BASE<CR>
    map <Leader>3 :diffget REMOTE<CR>
endif


