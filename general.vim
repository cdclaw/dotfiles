
" ---------- GLOBAL ----------
set encoding=UTF-8
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set noshowmode " turn off mode display - lightline will take care of that
" theme
if (has("termguicolors"))
 set termguicolors
endif
syntax on
colorscheme dracula
" terminal
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
" au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" panel navigation
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" python
let g:python3_host_prog = '/usr/bin/python3' " IMPORTANT: double-check
" let g:python_host_prog = '/usr/bin/python2' " IMPORTANT: double-check

" ---------- KEY MAP ----------
inoremap jk <ESC>
inoremap kj <ESC> 
" fzf
nnoremap <silent> <C-p> :call FZFOpen(':GFiles')<CR>
nnoremap <silent> <C-f> :call FZFOpen(':Files')<CR> 
" NERDTree
noremap <silent> <C-b> :NERDTreeToggle<CR>
" nerdcommenter
" " use ',c' to comment out the line in insert mode
inoremap ,c <C-o>: call NERDComment(0, "toggle")<C-m>
" " use 'ctrl /' to toggle comment
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle

