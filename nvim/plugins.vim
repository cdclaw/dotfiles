" ---- vim-polyglot
let g:polyglot_disabled = ['markdown']

"----------------------------------------------------------------------
"vim-plug
"----------------------------------------------------------------------

call plug#begin(stdpath('data') . '/plugged')

" lsp intellisense
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'kosayoda/nvim-lightbulb'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" tabline
Plug 'romgrk/barbar.nvim'

" syntaxt highlight
Plug 'sheerun/vim-polyglot'
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
Plug 'kyazdani42/nvim-web-devicons'

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
" set background=dark
" if exists('+termguicolors')
"   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"   set termguicolors
" endif
" colorscheme spaceduck
" ---------------------

" ----- tokyonight -----
if (has("termguicolors"))
 set termguicolors
endif
let g:tokyonight_style = "storm" " storm, night, day
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
colorscheme tokyonight
set background=dark
" ----------------------


"----------------------------------------------------------------------
"PLUGIN KEY MAPPINGS
"----------------------------------------------------------------------
" fzf
tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
nnoremap <silent> <C-f> :call FZFOpen(':Files')<CR>
nnoremap <silent> <C-p> :call FZFOpen(':GFiles')<CR> 
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
" let g:indentLine_fileTypeExclude = ['json','markdown']


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

" ---- lspconfig
" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" ---- vim-vsnip
" nvim-compe
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)


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
	\ 'colorscheme': 'tokyonight',
	\ 'active': {
	\ 	'left': [ [ 'mode', 'paste' ],
	\ 					  [ 'filename', 'gitbranch', 'readonly'] ]
	\ },
	\ 'component_function': {
        \  	'filename': 'LightlineFilename',
        \ 	'gitbranch': 'LightLineGitBranch'
	\ },
	\ }
function! LightLineGitBranch()
    return ' ' ..gitbranch#name()
endfunction

function! LightlineFilename()
    let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
    let modified = &modified ? ' +' : ''
    return filename . modified
endfunction

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

" ---- barbar tabline
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Close commands
"                          :BufferCloseAllButCurrent<CR>
"                          :BufferCloseBuffersLeft<CR>
"                          :BufferCloseBuffersRight<CR>
" Magic buffer-picking mode
nnoremap <silent> <C-s>    :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable current/total tabpages indicator (top right corner)
let bufferline.tabpages = v:true

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true
