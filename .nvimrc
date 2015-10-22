set scrolloff=3

set showcmd
set nobackup
set number
set relativenumber

set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

set visualbell t_bv=
set novisualbell

set backspace=indent,eol,start

set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set smartindent
set ai
set cin
set list
syntax on
filetype on
filetype indent on

call plug#begin('~/.nvim/plugged')

Plug 'jnurmine/Zenburn'
Plug 'easymotion/vim-easymotion'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

call plug#end()

colorscheme zenburn

imap jk <Esc>
imap ол <Esc>

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:netrw_liststyle=3

autocmd BufWritePre * :%s/\s\+$//e

map <Leader> <Plug>(easymotion-s)
nmap <C-L> :bn!<CR>
nmap <C-H> :bp!<CR>
nmap <C-A> :w<CR>:bd<CR>
nmap <C-S> :w<CR>
nmap tui :e! ~/.nvimrc<CR>

" перемещение по окнам
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Ctrl+P
set wildignore+=*/tmp/*,*/bower_components/*
set wildignore+=*/node_modules/*,*/dist/*,*.so,*.swp,*.zip

" colorcolumn
set cc=80

" x-clipboard
set clipboard=unnamedplus
