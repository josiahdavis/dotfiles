" Required configuration for vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Specify plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tmhedberg/SimpylFold'
Plugin 'crusoexia/vim-monokai'
Plugin 'preservim/nerdtree'
Plugin 'itchyny/lightline.vim'
Plugin 'zxqfl/tabnine-vim'

" Additional config for vundle
call vundle#end()
filetype plugin indent on
set shell=/bin/bash

" Setting the leader
let mapleader="\<Space>"

" Easier writing/quitting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>

" Color
syntax enable
silent! colorscheme monokai

" Apply formatter on save
au BufWrite * :Autoformat

" Disable fallback to vim's indent file, retabbing and removing trailing whitespace
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Use better code folding
let g:SimpylFold_docstring_preview = 1
nnoremap <space> za

" Use black formatter
let g:formatters_python=['black']

" Vim pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Hybrid line numbers
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Shifting code blocks in visual mode 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Nerdtree open/close toggle
map <C-o> :NERDTreeToggle<CR>

" Lightline status line
set laststatus=2

" Additional vim options
set encoding=utf-8
set ruler
set viminfo='20,<1000 " inc copy/paste-buffer
set tags=./.git/tags; " where to find ctags normally
set tags+=tags;/      " where to find ctags in ad-hoc package exploration
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab " Convert from tab char to spaces
set noerrorbells
set smarttab
set nowrap
set incsearch
set colorcolumn=88
