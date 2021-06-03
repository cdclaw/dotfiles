"----------------------------------------------------------------------
" KEY MAPPING
"----------------------------------------------------------------------
" use alt+hjkl to move between split/vsplit panels
" tnoremap <A-h> <C-\><C-n><C-w>h
" tnoremap <A-j> <C-\><C-n><C-w>j
" tnoremap <A-k> <C-\><C-n><C-w>k
" tnoremap <A-l> <C-\><C-n><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

" move cursor in insert mode
" noremap <C-h> <left>
" noremap <C-j> <down>
" noremap <C-k> <up>
" noremap <C-l> <right>
" inoremap <C-h> <left>
" inoremap <C-j> <down>
" inoremap <C-k> <up>
" inoremap <C-l> <right>

" use alt+ hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" use hjkl to navigate between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map <ESC> to jk and kj 
inoremap jk <ESC>
inoremap kj <ESC>

" alternate way to save
nnoremap <C-s> :w<CR>

" alternate way to quit
nnoremap <C-Q> :wq!<CR>
