call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-obsession'
Plug '4513ECHO/vim-colors-hatsunemiku'
Plug 'ulwlu/abyss.vim'
Plug 'jsit/toast.vim'
Plug 'novasenco/nokto'
Plug 'lighthaus-theme/vim-lighthaus'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" Lightline
" separator works with Iosevka font
let g:lightline = {
      \ 'colorscheme': 'lighthaus',
      \ 'separator': { 'left': '', 'right': '' }, 
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
  \ }

" Lighthaus
let g:lighthaus_vsplit_line_light = 1

" GitGutter
let g:gitgutter_async = 0

" NERDTree
let NERDTreeShowBookmarks = 1
let g:NERDTreeGitStatusWithFlags = 1 

" fzf
command! FZF call fzf#run(fzf#wrap({'options': '--reverse'}))
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse']}, <bang>0)

" CoC
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-json',
  \ 'coc-css',
  \ 'coc-emmet',
  \ 'coc-html',
  \ ] 
let g:coc_default_semantic_highlight_groups = 1

" treesitter
lua <<EOF
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = { "html", "css" },
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true
    }, 
}
EOF

