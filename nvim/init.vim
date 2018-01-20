let mapleader="\<SPACE>"
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
Plug 'zchee/deoplete-go', { 'do': 'make'}
    let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
Plug 'jodosha/vim-godebug'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'fatih/vim-go'
call plug#end()
set relativenumber
set number
au TermOpen * setlocal nonumber norelativenumber
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
tnoremap jk <C-\><C-n>
tnoremap jK <C-\><C-n>
tnoremap Jk <C-\><C-n>
tnoremap JK <C-\><C-n>

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader><CR> :vsp<Bar>term<CR>i
nnoremap <CR> :nohlsearch<CR><CR>
" # clipboard
" yank to clipboard
if has("clipboard")
    set clipboard=unnamed " copy to the system clipboard

    if has("unnamedplus") " X11 support
        set clipboard+=unnamedplus
    endif
endif

let g:ranger_replace_netrw = 1

" Go Config
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>r  <Plug>(go-run)<Paste>
autocmd FileType go nmap <leader>i  <Plug>(go-sameids-toggle)
function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
    	call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>


let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

