set scrolloff=3

set showcmd
set nobackup
set number
set relativenumber
set nowrap

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
filetype plugin indent on

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
Plug 'mileszs/ack.vim'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-fugitive'
" organizer
Plug 'hsitz/VimOrganizer'
Plug 'itchyny/calendar.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'vim-scripts/utl.vim'

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
nmap tui :e! $MYVIMRC<CR>

" перемещение по окнам
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
set clipboard=unnamed

" vim organizer
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()
let g:org_command_for_emacsclient = 'emacsclient'
