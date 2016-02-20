set scrolloff=3

set showcmd
set nobackup
set number
set relativenumber
set cursorline
set wrap
set linebreak
"set textwidth=80
set formatoptions=cq

if $TERM == "xterm-256color"
    set t_Co=256
endif

set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

set visualbell t_bv=
set novisualbell

set backspace=indent,eol,start
set mouse=a

set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
set smartindent
set ai
set cin
set list
set syntax=1
syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

call plug#begin('~/.nvim/plugged')

Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'w0ng/vim-hybrid'
Plug 'jnurmine/Zenburn'
Plug 'easymotion/vim-easymotion'
Plug 'jelera/vim-javascript-syntax'
Plug 'maksimr/vim-jsbeautify'
Plug 'bling/vim-airline'
Plug 'mattn/emmet-vim'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'mileszs/ack.vim'
Plug 'noah/vim256-color'
Plug 'scrooloose/nerdcommenter'
Plug 'tell-k/vim-autopep8'
Plug 'tmhedberg/SimpylFold'
Plug 'roman/golden-ratio'
Plug 'tpope/vim-fugitive'
Plug 'marijnh/tern_for_vim'
Plug 'mtth/scratch.vim'
" Plug 'Shougo/unite.vim'
Plug 'elzr/vim-json'
Plug 'tpope/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/YouCompleteMe'
Plug 'nvie/vim-flake8'
Plug 'jelera/vim-javascript-syntax'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'marijnh/tern_for_vim'

call plug#end()

imap jk <Esc>

let g:scratch_top=0
let g:scratch_height=10

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

let g:syntastic_check_on_open=1

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:netrw_liststyle=3
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

"autocmd BufWritePre * :%s/\s\+$//e
"set omnifunc=tern#Complete
let g:tern_show_argument_hints = 'on_move'
let g:SimpylFold_docstring_preview = 1

let mapleader = "'"

map <Leader> <Plug>(easymotion-s)
nmap <C-L> :bn!<CR>
nmap <C-H> :bp!<CR>
nmap <C-w> :w<CR>:bd<CR>
imap <C-S> jk:w<CR>
inoremap <C-w> <C-s>:bd<CR>
nmap tui :e! $MYVIMRC<CR>

" перемещение по окнам
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A-q> <C-w>q
nnoremap <A-v> <C-w>v
nnoremap <A-s> <C-w>s
nnoremap <A-w> :ScratchPreview<CR><C-w>j

colorscheme hybrid
set background=dark

" Ctrl+P
set wildignore+=*/tmp/*,*/bower_components/*
set wildignore+=*/node_modules/*,*/dist/*,*.so,*.swp,*.zip

" colorcolumn
"set cc=80

" x-clipboard
set clipboard+=unnamedplus

" vim organizer
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()
let g:org_command_for_emacsclient = 'emacsclient'

"swap
silent !mkdir ~/.vim/swap > /dev/null 2>&1
set backupdir=~/.vim/swap/
set directory=~/.vim/swap/

nnoremap ; :

" pep8
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=79

left g:flake8_show_in_gutter=1

" surround django
let b:surround_{char2nr("v")} = "{{ \r }}"
let b:surround_{char2nr("{")} = "{{ \r }}"
let b:surround_{char2nr("%")} = "{% \r %}"
let b:surround_{char2nr("b")} = "{% block \1block name: \1 %}\r{% endblock \1\1 %}"
let b:surround_{char2nr("i")} = "{% if \1condition: \1 %}\r{% endif %}"
let b:surround_{char2nr("w")} = "{% with \1with: \1 %}\r{% endwith %}"
let b:surround_{char2nr("f")} = "{% for \1for loop: \1 %}\r{% endfor %}"
let b:surround_{char2nr("c")} = "{% comment %}\r{% endcomment %}"

" greplace
set grepprg=ack
let g:grep_cmd_opts = '--noheading'
