set path+=**                " set path at project root
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching
set ignorecase smartcase    " case insensitive
set mouse=v                 " middle-click paste with
set hlsearch                " highlight search
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
" set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number relativenumber   " add line numbers (set both for hybrid)
" set wildmode=longest,list   " get bash-like tab completions
" set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set list
set listchars=tab:→·,space:·
" set scrolloff=8             " maintain lines when scrolling

" Folding with treesitter
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevelstart=99

set grepformat=%f:%l:%c:%m
set iskeyword-=_            " add characters to stop on when using 'w', 'b', etc.

" properly align cursor line number with relative numbers (right aligning the cursor line number)
let &stc='%s ' . '%=%{v:relnum?v:relnum:v:lnum} '
