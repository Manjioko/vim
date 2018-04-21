set encoding=utf-8
syntax on
"""vumdle设置
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

 call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"""a=，，a对齐
Plugin 'junegunn/vim-easy-align'
"""增加jsg语法高亮
Plugin 'jelera/vim-javascript-syntax'
"""主题
"Plugin 'tomasr/molokai'

Plugin 'tpope/vim-fugitive'

"""目录树
Plugin 'scrooloose/nerdtree'

"""状态栏信息
""Plugin 'Lokaltog/vim-powerline'

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

"""ement
Plugin 'mattn/emmet-vim'

"""语法高亮
Plugin 'scrooloose/syntastic'

"""括号自动补全
Plugin 'Raimondi/delimitMate'
"""函数树跳转？
Plugin 'majutsushi/tagbar'

""显示树的git的stutes
Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'iCyMind/NeoSolarized'
""缩进对其显示插件
Plugin 'Yggdroot/indentLine'

Plugin 'lepture/vim-jinja'

Plugin 'Glench/Vim-Jinja2-Syntax'

""javascript 高亮
Plugin 'vim-javascript'

"""jsx
Plugin 'mxw/vim-jsx'

""theme of gruvbox
Plugin 'morhetz/gruvbox'

""文档专用，好像是棒子开发
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
"Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jreybert/vimagit'
""html jump plugin
Plugin 'vim-scripts/matchit.zip'
"javascript tagbar
Plugin 'hushicai/tagbar-javascript.vim'
"search tool
Plugin 'Yggdroot/LeaderF'
"" look down bar
Plugin 'bling/vim-airline'
"" gooooo
"Plugin 'fatih/vim-go'
""one theme
Plugin 'rakr/vim-one'
call vundle#end()
filetype indent on
filetype plugin on
filetype plugin indent on    

"""ement配置
let g:user_emmet_expandabbr_key = ";'"
let g:user_emmet_install_global = 0
let g:user_emmet_mode='a'
autocmd FileType javascript,html,css,scss EmmetInstall
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

""yggroot 配置

let g:indentLine_char = '┆'            
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 1
""The default value is 2
let g:indentLine_setConceal = 2
let g:indentLine_color_term = 239 
"""let g:indentLine_color_term = 256
""if !has('conceal')
""    finish
""endif
""
""syntax keyword rubyControl not conceal cchar=¬
""syntax keyword rubyKeyword lambda conceal cchar=λ
""
""set conceallevel=2
"""""""""""""""""""""""""""""""""""""""""""""""

""powerline配置
""initalize setting is 2
""set laststatus=0
""let g:Powerline_symbols='unicode'
"""目录树配置

let NERDChristmasTree=1            " 让树更好看
let NERDTreeCaseSensitiveSort=1    " 让文件排列更有序
let NERDTreeChDirMode=1            " 改变tree目录的同时改变工程的目录
let NERDTreeWinPos="left"
let NERDTreeWinSize=25
let NERDTreeQuitOnOpen=1

"启动vim，没有打开任何文件时，开始NERDTree
autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent><F9> :NERDTreeToggle<CR>
"为方便复制，用<F4>开启/关闭行号显示:
nnoremap <F10> :set nonumber!<CR>:set foldcolumn=0<CR>



""以下是youcompleteme的设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
"""回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"
" 跳转到定义处
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>
"force recomile with syntastic
"nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>	
" nnoremap <leader>lo :lopen<CR>	"open locationlist
" nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>

" 不显示开启vim时检查ycm_extra_conf文件的信息  
let g:ycm_confirm_extra_conf=0
" 开启基于tag的补全，可以在这之后添加需要的标签路径  
let g:ycm_collect_identifiers_from_tags_files=1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 输入第2个字符开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1	
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}
"youcompleteme  默认tab  s-tab 和 ultisnips 冲突
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" 修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
let g:ycm_key_invoke_completion = '<M-;>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



nnoremap <space> :
inoremap ;<space> <Esc>
inoremap <D-J> <C-N>  
"inoremap j <C-N>
inoremap <C-J> <C-N>
inoremap k <C-P> 
""在插入模式中启用j;来表示上键
inoremap ;j <Down>
""在插入模式中启用k;来表示下键
inoremap ;k <Up>
""字符不能超过130行
set textwidth=250
set fo+=mB
""智能补全
set wildmenu
""光标所在行高亮
set cursorline
""不使用swap文件
set noswapfile
"""不折叠代码
"set nofoldenable
set number
set nocompatible
set ic
set is
set hls
"""""""这四行对于yggbroot的设置至关重要
set tabstop=2 "tab行数 
set softtabstop=2 "关闭tab行数（如果之前存在的话）
set shiftwidth=2 "智能设置tab宽度为4格
set expandtab "智能给你tab
"""""""
set cul
set smartindent
"set cuc
set ru
set spell
set showcmd
set ignorecase smartcase 
set helplang=cn
set backspace=indent,eol,start " 非常好用的Backspace键设置"
set showmatch
set ruler                   "打开状态栏标尺
set magic                   "设置魔术
set lazyredraw              " redraw only when we need to
set completeopt=longest,menu

set t_Co=256
set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum
set termguicolors
"colorscheme NeoSolarized 
colorscheme gruvbox 
set background=dark
let g:pydiction_location='~/.vim/complete-dict'
set mouse=a


"""jinja2 setting
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja

"""jsx setting
let g:jsx_ext_required = 1
"""italic font
let g:gruvbox_italic=1


"""代码折叠设置
set foldmethod=marker
set foldenable              " 开始折叠
set foldmethod=manual       " 设置语法折叠
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码
set foldlevel=0
set modelines=1

""""文档专用goyo设置
let g:goyo_width=110 
let g:goyo_height=40 
let g:goyo_linenr=0 
nmap <Leader>l :Goyo<CR>
xmap <Leader>l :Goyo<CR>
"进入goyo模式后自动触发limelight,退出后则关闭
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


"""""""jsx插件配置
let g:jsx_ext_required = 0

"""vim-javascript 配置
let g:javascript_plugin_jsdoc = 0
let g:javascript_plugin_ngdoc = 0
let g:javascript_plugin_flow = 0
augroup javascript_folding
    au!
    au filetype javascript,html setlocal foldmethod=syntax
augroup end
syntax on 

if &term =~"lxterm"
    if has("terminfo")
        set t_Co=8
        set t_Sf=<Esc>[3%p1%dm
        set t_Sb=<Esc>[4%p1%dm
    else
        set t_Co=8 set t_Sf=<Esc>[3%p1%dm set t_Sf=<Esc>[4%p1%dm 
    endif
endif
""用eslint检查语法
let g:syntastic_javascript_checkers = ['eslint']
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
    let g:syntastic_javascript_eslint_exec = local_eslint
endif

""setting vimagit
let g:magit_enabled = 1

""map the 'leader' key to ',' key
let mapleader=","
let g:mapleader=","
"map tagbar to F11
nmap <F8> :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags' 
let g:tagbar_width = 30 
let g:tagbar_autofocus = 1 

