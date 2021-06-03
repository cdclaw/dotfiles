" ---------- PLUGINS ----------
" ---- vim-plug ---- 

call plug#begin(stdpath('data') . '/plugged')

" coc - autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
" syntax highlight
Plug 'sheerun/vim-polyglot'
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

" ---- vim-plug ends

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

" ---------- PLUGIN KEY MAPPING ----------
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

" ---------- PLUGIN CONFIG ----------
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

" coc
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-tsserver',
	\ 'coc-eslint',
	\ 'coc-json',
	\ 'coc-prettier',
	\ ]

autocmd FileType javascript let b:coc_pairs_disabled = ['<']
" " Always show the signcolumn, otherwise it would shift the text each time
" " diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" " use tab for trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" " Make <CR> auto-select the first completion item and notify coc.nvim to
" " format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" " GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" " Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" " Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " ---- Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" " ---- coc extensions
" vim-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile


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
