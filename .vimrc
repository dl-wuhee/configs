set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'VundleVim/Vundel.vim'
Plugin 'phresher/vim-openfoam'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-airline'
Plugin 'a.vim'
Plugin 'VisIncr'
Plugin 'Emmet.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'xptemplate'
Plugin 'lervag/vimtex'
Plugin 'winmanager'

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


if has('gui_running')
    set guioptions-=T
    set lines=40
    set columns=138
    set linespace=0
    set guifont=DejaVu\ Sans\ Mono\ 12
endif


filetype plugin on
filetype plugin indent on

set fileencoding=utf-8
set fileencodings=utf-8,gbk,utf-16,big5

set title
set showcmd
set fileformat=unix
set incsearch
set hlsearch
set ignorecase smartcase
set cmdheight=2

syntax enable
colorscheme torte
highlight FoldColumn guibg=black guifg=yellow
highlight FoldColumn ctermbg=black ctermfg=yellow
highlight CursorLine guibg=lightblue guifg=black ctermbg=lightgray ctermfg=black
highlight CursorColumn guibg=lightblue ctermbg=lightgray guifg=black ctermfg=black 

set autowrite
"set browsedir=current
set browsedir=buffer
set autochdir

set cursorline
set number

set wrap
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set ambiwidth=double

set linebreak

"set rtp+=~/.vim/bundle/powerline/powerline/binding/vim/
set laststatus=2
set showtabline=2
set noshowmode
set t_Co=256

highlight FoldColumn guibg=black guifg=yellow
highlight CursorLine guibg=blue guifg=white
highlight CursorColumn guibg=lightblue guifg=black

map <F4> :NERDTreeFind<CR>
map ,h h
map ,j j
map ,k k
map ,l l
map ,H H
map ,L L
map ,K K
map ,J J
map ,s :tabnew ~/.vimrc<CR>
map <F8> :nohl<CR>
map ,df ]
map ,] 
map ,[ 
map zs g
noremap <F7> :source ~/.vimrc<CR>
map ,s :tabnew ~/.vimrc<CR>
map ,y "+y
map ,p "+p
noremap <F3> :source ~/.vimrc<cr>

"function! rc:isNTOpen()
    "return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
"endfunction

"function! rc:syncTree()
    "if &modifiable && rc:isNTOpen() && strlen(expand('%')) >0 && !&diff
        ""NERDTreeTabsFind
        "NERDTreeFind
        "wincmd p
    "endif
"endfunction

let g:winManagerWindowLayout="NERDTree|TagList"
let g:NERDTree_title='[NERDTree]'

nmap <F2> :WMToggle<CR>

function! NERDTree_Start()
    exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
    return 1
endfunction




let g:tex_flavor='latex'
let g:vimtex_enabled = 1
let g:vimtex_quickfix_mode=2
"set conceallevel=1
"let g:tex_conceal='abdmg'
let g:vimtex_view_enabled = 1
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'options' : [
    \   '-pdf',
    \   '-pdflatex=xelatex',
    \ 	'-verbose',
    \ 	'-file-line-error',
    \ 	'-synctex=1',
    \ 	'-interaction=nonstopmode',
    \ ],
    \ }
let g:vimtex_view_method = 'zathura'
"let g:vimtex_view_general_viewer = 'zathura'
"let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

if has('autocmd')
	function! SetFortran()
		nmap <F11> :!pyfmf
		setlocal nowrap

		setlocal laststatus=2
		setlocal textwidth=120

		"let fortran_have_tabs=1
		setlocal list
		setlocal listchars=tab:\|\ 

		let s:extfname=expand("%:e")
		if s:extfname==?"f90"
			let g:fortran_dialect="F"
			let g:fortran_free_source=1
			unlet! g:fortran_fixed_source
		else
			let g:fortran_fixed_source=1
			unlet! g:fortran_free_source
			unlet! g:fortran_dialect
		endif
		let g:fortran_fold=1
		let g:fortran_do_enddo=1
		let g:fortran_more_precise=1
		let g:fortran_fold_conditionals=1
		"let g:fortran_fold_multilinecomments=1
		setlocal foldmethod=syntax

	endfunction

	function! Gnu2Pdf()
		:silent !"python f:\ld_tools\diy\python\gnuplot2epspdf\gnu2pdfv6.pyw" "%:p:r.gnuplot"
	endfunction

	au FileType fortran call SetFortran()
	au BufWritePost *.gnuplot  call Gnu2Pdf()
endif
