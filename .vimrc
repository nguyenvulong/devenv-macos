"
" General config, do not include a closing quote
"
set nu
set hlsearch
set nocompatible
set encoding=utf-8
set ts=4
set expandtab
set shiftwidth=4
set showmatch
set termguicolors

"
" vimplug config
"
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

"
" List your plugins here
"
Plug 'tpope/vim-sensible'
Plug 'girishji/autosuggest.vim'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

if has("syntax")
  syntax on
endif
