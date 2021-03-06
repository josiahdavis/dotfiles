" Auto install vim-plug
if empty(glob("$VIM/autoload/plug.vim"))
    silent !curl -sfLo $VIM/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall
endif


call plug#begin()

" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
    autocmd VimEnter * PlugInstall | q
endif

Plug 'Chiel92/vim-autoformat'
Plug 'tmhedberg/SimpylFold'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'zxqfl/tabnine-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank'
Plug 'nelstrom/vim-visual-star-search'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

set shell=/bin/zsh

" Markdown preview
nmap <C-p> <Plug>MarkdownPreviewToggle

" Setting the leader
let mapleader="\<Space>"

set rtp+=/usr/local/opt/fzf

" Make cursor always at middle of screen
augroup VCenterCursor
au!
au BufEnter,WinEnter,WinNew,VimResized *,*.*
\ let &scrolloff=winheight(win_getid())/2
augroup END

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" Symbol renaming.
nmap <Leader>rn <Plug>(coc-rename)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
" let coc start without warning on older vim versions
let g:coc_disable_startup_warning = 1

" Easier writing/quitting
nnoremap <Leader>w :w<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>r :so %<CR>
nnoremap <Leader>e :e!<CR>

" Copy to the system clipboard
vnoremap <Leader>y "+y

" Line insertion in normal mode
nnoremap <Leader>O O<Esc>
nnoremap <Leader>o o<Esc>

" Color
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
syntax enable
set background=dark

" Apply formatter on save
au BufWrite * :Autoformat

" Disable fallback to vim's indent file, retabbing and removing trailing whitespace
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Use better code folding
let g:SimpylFold_docstring_preview = 1
" nnoremap <Tab> za
" nnoremap <expr> <S-CR> &foldlevel ? 'zM' :'zR'

" Use black formatter
let g:formatters_python=['black']

" Vim pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Pane creation
nnoremap <Leader>v <C-W>v " side-by-side
nnoremap <Leader>s <C-W>s " vertical 

" Pane resizing
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

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

" Searching within a file
"nnoremap <CR> :nohlsearch<CR><CR>
nnoremap <silent> <CR> :nohlsearch<Bar>:echo<CR>
set hlsearch
" set incsearch

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

" Searching for a file
nnoremap <C-f> :Files<Cr>
nnoremap <C-g> :Rg<Cr>

" Nerdtree open/close toggle
map <C-n> :NERDTreeToggle<CR>

" Lightline status line
set laststatus=2

" Avoid unintentional switches to Ex mode.
nnoremap Q <nop>

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
set visualbell
set t_vb=
set smarttab
set nowrap
set colorcolumn=88
set cursorline
