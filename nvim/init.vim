let mapleader="\<SPACE>"
set termguicolors
syntax on
colorscheme solarized8_dark
let python_highlight_all = 1
let g:python_host_prog = '/Users/alec/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/alec/.pyenv/versions/neovim3/bin/python'

call plug#begin('~/.config/nvim/plugged/')
    " Universal
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'mileszs/ack.vim'
        cnoreabbrev Ack Ack!
        nnoremap <Leader>a :Ack!<Space>
    Plug 'janko-m/vim-test'
    Plug 'thaerkh/vim-workspace'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        let g:deoplete#enable_at_startup = 1
        autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
        inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    Plug 'scrooloose/nerdtree'
        nnoremap <silent> <leader>f :NERDTreeToggle<cr>
        let NERDTreeMinimalUI=1
    Plug 'airblade/vim-gitgutter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline_solarized_bg='dark'
    Plug 'w0rp/ale'
    "Plug 'tpope/vim-sensible'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        let g:fzf_action = {
                    \ 'ctrl-t': 'tab split',
                    \ 'ctrl-x': 'split',
                    \ 'ctrl-v': 'vsplit' }
        nnoremap <silent> <c-x> :FZF<cr>

    " Go
    Plug 'zchee/deoplete-go', { 'do': 'make'}
        let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
        let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
    Plug 'jodosha/vim-godebug'
    Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' } 
    Plug 'fatih/vim-go'
    Plug 'godoctor/godoctor.vim'
    Plug 'SirVer/ultisnips'
    Plug 'scrooloose/nerdcommenter'
    Plug 'ervandew/supertab'
        let g:SuperTabDefaultCompletionType = '<C-n>'

        " better key bindings for UltiSnipsExpandTrigger
        let g:UltiSnipsExpandTrigger = "<tab>"
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

    " Python
    Plug 'zchee/deoplete-jedi'
    Plug 'plytophogy/vim-virtualenv'

    " Thrift
    Plug 'solarnz/thrift.vim'
call plug#end()

set relativenumber
set number
set undofile
au TermOpen * setlocal nonumber norelativenumber
language en_US
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/

set hidden
set splitbelow
set splitright
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
autocmd BufEnter * if &buftype == "terminal" | startinsert | endif
command Tsplit split term://$SHELL
command Tvsplit vsplit term://$SHELL
command Ttabedit tabedit term://$SHELL
nnoremap <bs> <c-^>
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
nnoremap <leader>s :%s/
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

"Git Config
nmap <leader>gr :Gread<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gm :Gmove 
nmap <leader>gd :Gremove<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gb :Gblame<CR>

" Python Config
au FileType python nmap <leader>r :vsp \| term python3 %<CR>i
let g:virtualenv_auto_activate = 1

" Go Config
au FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)
au FileType go nmap <leader>r :Rename 
au FileType go nmap <Leader>rs <Plug>(go-run-split)
au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
au FileType go nmap <leader>i  <Plug>(go-sameids-toggle)
au FileType go nmap <leader>e  <Plug>(go-referrers)
au FileType go nmap <leader>d  :GoDebug<CR>
au FileType go nmap <leader>p  :GoToggleBreakpoint<CR>

function! s:build_go_files()
	let l:file = expand('%')
	if l:file =~# '^\f\+_test\.go$'
    	call go#test#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_term_mode = "vsplit"
let g:go_term_enabled = 0
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
let g:go_info_mode = 'gocode'

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

