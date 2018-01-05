let maplocalleader=','
let mapleader=','
set termguicolors
syntax on
colorscheme solarized8_dark
let python_highlight_all = 1
call plug#begin('~/.config/nvim/plugged/')
Plug 'whatyouhide/vim-gotham'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#omni#input_patterns = {}
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
Plug 'rbgrouleff/bclose.vim'
Plug 'scrooloose/nerdtree'
    nnoremap <silent> <leader>f :NERDTreeToggle<cr>
    let NERDTreeMinimalUI=1
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    let g:airline_solarized_bg='dark'
Plug 'w0rp/ale'
Plug 'zchee/deoplete-jedi'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	let g:fzf_action = {
				\ 'ctrl-t': 'tab split',
				\ 'ctrl-x': 'split',
				\ 'ctrl-v': 'vsplit' }
	nnoremap <silent> <c-x> :FZF<cr>
Plug 'kchmck/vim-coffee-script'
Plug 'airblade/vim-gitgutter'
call plug#end()
set relativenumber
set number
language en_US
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set hidden
set splitright " Split to right by default
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autowrite
set scrolloff=10
set backspace=indent,eol,start
set wildmenu
set showtabline=0
set laststatus=2
set noshowmode
set encoding=utf-8
set hlsearch
set termencoding=utf-8
au FocusLost * silent! wall
au BufLeave * silent! wall
au BufWinEnter,WinEnter term://* startinsert
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
tnoremap <Esc> <C-\><C-n>

inoremap jk <esc>
inoremap jK <esc>
inoremap Jk <esc>
inoremap JK <esc>

let g:ranger_replace_netrw = 1
