set showmatch                 " Show matching 
set ignorecase                " Case insensitive 
set mouse=v                   " Middle-click paste with 
set hlsearch                  " Highlight search 
set incsearch                 " Incremental search
set tabstop=2                 " Number of columns occupied by a tab 
set softtabstop=2             " See multiple spaces as tabstops so <BS> does the right thing
set expandtab                 " Converts tabs to white space
set shiftwidth=2              " Width for autoindents
set autoindent                " Indent a new line the same amount as the line just typed
set number                    " Add line numbers
set relativenumber            " Display numbers starting from current line
set wildmode=longest,list     " Get bash-like tab completions
set colorcolumn=120           " Set an 80 column border for good coding style
filetype plugin indent on     " Allow auto-indenting depending on file type
syntax on                     " Syntax highlighting
set clipboard=unnamedplus     " Using system clipboard
filetype plugin on
set cursorline                " Highlight current cursorline
set ttyfast                   " Speed up scrolling in Vim
set backupdir=~/.cache/nvim   " Directory to store backup files 

highlight ColorColumn ctermbg=DarkMagenta " Set ColorColumn's color


let mapleader=" "             " Map leader key to space

nnoremap <Leader>w :w<Enter>
nnoremap <Leader>q :q<Enter>
inoremap kj <Esc>
