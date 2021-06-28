███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗
████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║
██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║
██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║
██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║
╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝

# Dotfiles

Hello world. This is a collection of my neovim, (emm.. neovim is the only one here, for now :) ) configurations.

## NeoVim Configuration
Neovim is a fork of vim and also a super cool replacement of vim. I choose over Neovim over vim because it allows plugins to run asynchronously so that they do not freeze the editor. 

### Structure
I modularized my init.vim file just to make it looks clearer. My init.vim does nothing except sourcing other files.

| File             | Description                               | 
| ---------------- | ----------------------------------------- |
| init.vim         | entry point for sourcing                  | 
| general.vim      | general config                            |
| plugins.vim      | plugins and related config                | 
| mappings.vim     | key mappings & plugin key mappings        |
| lsp/config.vim   | Language Server Protocol related settings |

### Plugins
* Plugin Manager - [vim-plug]('https://github.com/junegunn/vim-plug')
* File Explorer - [NERDTree]('https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt')
* Icons 
  * [vim-devicons]('https://github.com/ryanoasis/vim-devicons')
  * [nvim-web-devicons]('https://github.com/kyazdani42/nvim-web-devicons')
* Statusline - [lightline]('https://github.com/itchyny/lightline.vim')
* Statusline git branch - [vim-gitbranch]('https://github/itchyny/vim-gitbranch')
* Start Screen - [vim-startify]('https://github.com/mhinz/vim-startify')
* Markdown Preview - [markdown-preview]('https://github.com/iamcco/markdown-preview.nvim')
* File Search - [fzf]('https://github.com/junegunn/fzf')
* Commenter - [nerdcommenter]('https://github.com/preservim/nerdcommenter')
* Theme - [Dracula vim]('https://draculatheme.com/vim')
* Autoclose Tag - [vim-closetag]('https://github.com/alvan/vim-closetag')
* Indent Line - [indentLine]('https://github.com/Yggdroot/indentLine')
* LSP
  * [nvim-lspconfig]('https://github.com/neovim/nvim-lspconfig') 
  * Autocomplete - [nvim-compe]('https://github.com/hrsh7th/nvim-compe') 
  * Snippets - [vim-vsnip]('https://github.com/neovim/vim-vsnip')
  * VSCode 💡 - [nvim-lightbulb]('https://github.com/nvim-lightbulb')

### Key Maps

See `mappings.vim` for detail

Panel navigation - `ctrl+hjkl` to move bwteen split/vsplit panels

Switch between tabs - `gt` or see barbar tabline section in `mappings.vim` 

Open terminal - `ctrl+n`

`<ESC>` remap - jk / kj (yes, I mapped both of them just in case)

NERDTree
* `ctrl-b` to toggle NERDTree view

File Search (with fzf) 
* `ctrl+p` to search in git repo
* `ctrl+f` to search all

Open file after select from search result
* `ctrl+s` to open on vsplit window
* `ctrl+t` to open in a new tab

Nerdcommenter
* `ctrl+/` to toggle comment
* `,+c` to toggle comment in insert mode

#### Documentation
* [NERDTree]('https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt')

