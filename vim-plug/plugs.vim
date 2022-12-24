call plug#begin()
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'

" requires C compiler
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'karb94/neoscroll.nvim'

Plug 'mbbill/undotree'

" ***********LSP Zero
" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'VonHeikemen/lsp-zero.nvim'

" ***********

" themes
Plug '4513ECHO/vim-colors-hatsunemiku'
" Plug 'ulwlu/abyss.vim'
Plug 'jsit/toast.vim'
Plug 'novasenco/nokto'
Plug 'lighthaus-theme/vim-lighthaus'
Plug 'tomasiser/vim-code-dark'
Plug 'https://gitlab.com/madyanov/gruber.vim'

call plug#end()

" LSP Zero
lua <<EOF
local lsp = require('lsp-zero')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'pylsp',
  'rust_analyzer',
  'jdtls'
})

lsp.preset('recommended')
lsp.setup()

-- current system does not allow for the mason.providers.registry-api
require("mason").setup {
	providers = {
		"mason.providers.client",
		"mason.providers.registry-api",
	}
}
EOF

" Lightline
" separator works with Iosevka NF font
let g:lightline = {
      \ 'colorscheme': 'lighthaus',
      \ 'separator': { 'left': '', 'right': '' }, 
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'charvaluehex', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'time' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B',
      \   'time': '%{strftime("%b %d %Y %H:%M")}'
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

" treesitter
lua <<EOF
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all"
  ensure_installed = { "java", "javascript", "python", "markdown", "lua", "rust", "vim" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  }
}
EOF

" indent blankline
" lua <<EOF
" vim.opt.list = true
" vim.opt.listchars:append("space:⋅")

" require("indent_blankline").setup {
"     space_char_blankline = " ",
"     show_current_context = true,
"     show_current_context_start = true,
" }
" EOF

" Neoscroll
" lua <<EOF
" require('neoscroll').setup({
"     -- All these keys will be mapped to their corresponding default scrolling animation
"     mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
"                 '<C-y>', '<C-e>'},
"     hide_cursor = true,          -- Hide cursor while scrolling
"     stop_eof = true,             -- Stop at <EOF> when scrolling downwards
"     use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
"     respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
"     cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
"     easing_function = cubic,       -- Default easing function
"     pre_hook = nil,              -- Function to run before the scrolling animation starts
"     post_hook = nil,             -- Function to run after the scrolling animation ends
"     performance_mode = false,    -- Disable "Performance Mode" on all buffers.
" })
" EOF

