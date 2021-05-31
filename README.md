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

| File             | Description              | Location                   | 
| ---------------- | ------------------------ | -------------------------- |
| init.vim         | init file                | ~/.config/nvim/init.vim    |
| general.vim      | general config & key map | ~/.config/nvim/general.vim |
| plugins.vim      | plugins and config       | ~/.config/nvim/plugins.vim |


### Plugins
* Plugin Manager - [vim-plug]('https://github.com/junegunn/vim-plug')
* Autocompletion - [Coc]('https://github.com/neoclide/coc.nvim')
* File Explorer - [NERDTree]('https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt')
* Icons - [vim-devicons]('https://github.com/ryanoasis/vim-devicons')
* Statusline - [lightline]('https://github.com/itchyny/lightline.vim')
* Start Screen - [vim-startify]('https://github.com/mhinz/vim-startify')
* Markdown Preview - [markdown-preview]('https://github.com/iamcco/markdown-preview.nvim')
* Commenter - [nerdcommenter]('https://github.com/preservim/nerdcommenter')
* Theme - [Dracula vim]('https://draculatheme.com/vim')

### Key Maps

Panel navigation - `alt+hjkl` to move bwteen split/vsplit panels

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

Coc
* `gd` to go to code defination when hover
* `F2` to rename current word

Nerdcommenter
* `ctrl+/` to toggle comment


#### Documentation
* [NERDTree]('https://github.com/preservim/nerdtree/blob/master/doc/NERDTree.txt')


