set number
set relativenumber
set cursorline
"set cursorcolumn
set autoindent
set cindent

set tabstop=4
set softtabstop=4
set shiftwidth=4

set mouse=a

set expandtab
set smarttab
set ignorecase
set hlsearch
set incsearch
set smartindent
set backspace=2

set wrap

set timeoutlen=200

syntax on

colorscheme gruvbox
set background=dark

let mapleader=' '

" vundle configuration

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'preservim/nerdtree'
Plugin 'preservim/nerdcommenter'
Plugin 'itchyny/lightline.vim'
Plugin 'luochen1990/rainbow'
Plugin 'jiangmiao/auto-pairs'
Plugin 'liuchengxu/vim-which-key'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

filetype plugin indent on

imap jk <Esc><CR>

"窗口切换
nmap <Leader>wj <C-W>j
nmap <Leader>wk <C-W>k
nmap <Leader>wl <C-W>l
nmap <Leader>wh <C-W>h

"nerdtree
nmap <Leader>e :NERDTreeMirror<CR>
nmap <Leader>e :NERDTreeToggle<CR>

"lightline
set laststatus=2
let g:lightline={'colorscheme':'PaperColor'}

"rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],'operators': '_,_','parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],'separately': {'*': {},'tex': {'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],},'lisp': {'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],},'vim': {'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],},'html': {'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],},'css': 0,}}

"cscope
if has("cscope")
    if filereadable("cscope.out")
        cs add cscope.out
    endif
endif

set cscopequickfix=s-,c-,d-,i-,t-,e-

"find assignments to this symbol
nmap <Leader>gs :scs find s <C-R>=expand("<cword>")<CR><CR>
"find this definition
nmap <Leader>gg :scs find g <C-R>=expand("<cword>")<CR><CR>
"find functions calling this function
nmap <Leader>gc :scs find c <C-R>=expand("<cword>")<CR><CR>
"find this text string
nmap <Leader>gt :scs find t <C-R>=expand("<cword>")<CR><CR>
"find this egrep pattern
nmap <Leader>ge :scs find e <C-R>=expand("<cword>")<CR><CR>
"find this file
nmap <Leader>gf :scs find f <C-R>=expand("<cfile>")<CR><CR>
"find files #including this file
nmap <Leader>gi :scs find i <C-R>=expand("<cfile>")<CR><CR>
"find functions called by this function
nmap <Leader>gd :scs find d <C-R>=expand("<cword>")<CR><CR>

"which key
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

let g:which_key_map={}
let g:which_key_map.g={'name':'+cscope'}
let g:which_key_map.g.s='find assignments to this symbol'
let g:which_key_map.g.g='find thie definition'
let g:which_key_map.g.c='find functions calling this function'
let g:which_key_map.g.t='find this text string'
let g:which_key_map.g.e='find this grep pattern'
let g:which_key_map.g.f='find this file'
let g:which_key_map.g.i='find files #including this file'
let g:which_key_map.g.d='find functions called by this function'

call which_key#register('<Space>', "g:which_key_map")

"ycm
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
" 不要自动弹出函数原型预览窗口
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 1
