"----------------------------------------------------------------------
"vim-plug
"----------------------------------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

" intellisense
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kosayoda/nvim-lightbulb'

" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" file search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" theme
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'dracula/vim', { 'as': 'dracula'}
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
" icons
Plug 'ryanoasis/vim-devicons'
" statusline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
" NeoVim start screen
Plug 'mhinz/vim-startify'
" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" commenter
Plug 'preservim/nerdcommenter'
" autoclose tag
Plug 'alvan/vim-closetag'
" indent line
Plug 'Yggdroot/indentLine'

call plug#end()

"----------------------------------------------------------------------
"THEME & COLORS
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


"----------------------------------------------------------------------
"PLUGIN KEY MAPPINGS
"----------------------------------------------------------------------
" fzf
" use <Esc> to exit fzf
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
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

"----------------------------------------------------------------------
"PLUGIN CONFIGS
"----------------------------------------------------------------------
" ---- indentLine
let g:indentLine_setColors = 0
let g:indentLine_char = '│'
au FileType markdown let g:indentLine_setConceal= 0
" let g:indentLine_fileTypeExclude = ['json','markdow']
" ---- vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml,jsx,javascript'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_close_shortcut = '<leader>>'
let g:closetag_shortcut = '>'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" ---- nerdcommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1 " add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1 " use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left' " align line-wise comment delimiters flush left instead of following code indentation
let g:MERDCommentEmptyLines = 1 " allow commenting and inverting empty lines

" ---- LSP config 
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)


" ---- nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 1

" ---- vim-startify
let g:startify_session_persistence = 1 " update session automatically as you exit vim
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks") " use NERDTree bookmarks
let g:startify_lists = [
	\ { 'type': 'dir',	'header': ['	Recent Files'] },
	\ { 'type': 'sessions', 'header': ['	Sessions'] },
	\ { 'type': 'bookmarks','header': ['	Bookmarks']      },
	\ ]
let g:startify_custom_header = [
	\ "	",
	\ "	█████████████████████████████████████████",
	\ "	█─▄▄▄─█▄─▄▄▀█─▄▄▄─█▄─▄████▀▄─██▄─█▀▀▀█─▄█",	
	\ "	█─███▀██─██─█─███▀██─██▀██─▀─███─█─█─█─██",
	\ "	▀▄▄▄▄▄▀▄▄▄▄▀▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▀▄▄▄▀▄▄▄▀▀",
	\ "	",
	\]
" ---- lightline
let g:lightline = {
	\ 'colorscheme': 'spaceduck',
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\ 					  [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified'] ]
	\ },
	\ 'component_function': {
	\ 	'costatus': 'coc#status',
	\ 	'gitbranch': 'gitbranch#name'
	\ },
	\ }
" ---- nerdtree-syntax-highlight
let g:NERDTreeHighlightFolders = 1 " Enable folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " Highlight folder name

" ---- nerdtree
let g:NERDTreeStatusLine = '' " set empty to use lightline
let g:NERDTreeIgnore = ['node_modules$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" " Close window if NERDTree is the last one
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" " Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" ---- fzf
" placement
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:70%' --layout reverse --margin=1,4"
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'vsplit',
  \}

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction
