"----------------------------------------------------------------------
"BASIC SETTINGS
"----------------------------------------------------------------------
if has('syntax')  
	syntax enable 
	syntax on 
endif
set nowrap
set encoding=UTF-8
set hidden
set mouse=a " enable mouse
set ruler " show cursor position all the time
set number " line numbers
set tabstop=2 " insert 2 space for tab
set shiftwidth=2 " number of space inserted for indentation
set splitright " open new split panes to right and below
set splitbelow
set nocompatible " required by polyglot
set t_Co=256 " support 256 colors
set noshowmode " [lightline]turn off mode display - lightline will take care of that
set nobackup " [coc]some server have issues with backup files
set nowritebackup " [coc]
set cmdheight=2 " give more space for displaying message
set updatetime=300 " [coc]having longer update time leads to noticeable delays and poor user experience
set shortmess+=c
set clipboard=unnamedplus " copy past between vim and everything else
set cursorline " enable highlighting of the current line
" Recover last cursor position when open files
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

"----------------------------------------------------------------------
"TAB & INDENTATION
"----------------------------------------------------------------------
set smarttab 
set expandtab " convert tabs to space
set cindent
set autoindent

"----------------------------------------------------------------------
" SEARCH
"----------------------------------------------------------------------
set ignorecase " case insensitive when search
set smartcase " smart case sensitive, change to case sensitive when search term includes uppercase letter

"----------------------------------------------------------------------
"TERMINAL
"----------------------------------------------------------------------
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>


"----------------------------------------------------------------------
" OTHER
"----------------------------------------------------------------------
if has('folding')
	" allow folding
	set foldenable
	" fold code use indent
	set fdm=indent
	set foldlevel=99
endif

let g:python3_host_prog = '/usr/local/bin/python3' " IMPORTANT: double-check
" let g:python_host_prog = '/usr/bin/python2' " IMPORTANT: double-check
