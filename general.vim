
" ---------- Basic Settings ----------
set encoding=UTF-8
set smarttab
set cindent
set autoindent
set ruler
set number
set nocompatible " required by polyglot
set t_Co=256
set tabstop=2
set shiftwidth=2
set noshowmode " turn off mode display - lightline will take care of that
" Recover last cursor position when open files
autocmd BufReadPost *
	\ if line("'\"") > 1 && line("'\"") <= line("$") |
	\	 exe "normal! g`\"" |
	\ endif

" ---------- Search Settings ---------- 
set ignorecase " case insensitive when search
set smartcase " smart case sensitive, change to case sensitive when search term includes uppercase letter

" ---------- Theme / Color ----------
" ----- spaceduck -----
set background=dark
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif
colorscheme spaceduck
" ---------------------

" ----- tokyonight -----
" if (has("termguicolors"))
"  set termguicolors
" endif
" let g:tokyonight_style = "night" " storm, night, day
" let g:tokyonight_italic_functions = 1
" colorscheme tokyonight
" set background=dark
" ----------------------
" ---------- Syntax Highlight ----------
if has('syntax')  
	syntax enable 
	syntax on 
endif

" ---------- Terminal ----------
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" ---------- Key Mappings ----------
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" move cursor in insert mode
noremap <C-h> <left>
noremap <C-j> <down>
noremap <C-k> <up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

" map <ESC> to jk and kj 
inoremap jk <ESC>
inoremap kj <ESC> 

" ---------- Folding ----------
if has('folding')
	" allow folding
	set foldenable
	" fold code use indent
	set fdm=indent
	set foldlevel=99
endif


" ---------- Python ----------
let g:python3_host_prog = '/usr/local/bin/python3' " IMPORTANT: double-check
" let g:python_host_prog = '/usr/bin/python2' " IMPORTANT: double-check
