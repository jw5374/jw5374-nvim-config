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

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }

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
local lspconfig = require('lspconfig')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'pylsp',
  'rust_analyzer',
  'jdtls'
})

lsp.preset('recommended')

lspconfig.clangd.setup({
--	cmd = { "C:\\Espressif\\tools\\esp-clang\\16.0.1-fe4f10a809\\esp-clang\\bin\\clang.exe", vim.fn.expand('%') },
--	root_dir = function(fname)
--		return vim.loop.cwd()
--	end,
	filetypes = { '.nothing' }
})

lspconfig.arduino_language_server.setup({
	cmd = {"arduino-language-server", "-cli-config", "C:\\Users\\EverydayToothbrsuh\\AppData\\Local\\Arduino15\\arduino-cli.yaml"}
})

local lsp_configurations = require('lspconfig.configs')

if not lsp_configurations.clangd_esp then
  lsp_configurations.clangd_esp = {
    default_config = {
      name = 'clangd-esp',
      cmd = {'C:\\Users\\EverydayToothbrsuh\\AppData\\Local\\nvim-data\\mason\\bin\\clangd-esp.cmd'},
      filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      root_dir = require('lspconfig.util').root_pattern('.clangd', '.clang-tidy', '.clang-format', 'compile_commands.json', 'compile_flags.txt', 'configure.ac', '.git')
    }
  }
end

lspconfig.clangd_esp.setup({})

lsp.setup()

local cmp = require('cmp')

cmp.setup({
  sources = {
    {name = 'nvim_lsp'},
    {name = 'buffer'},
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
  }
})

-- current system does not allow for the mason.providers.registry-api
require("mason").setup {
	PATH = "prepend",
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
	additional_vim_regex_highlighting = { "markdown" },
  }
}
EOF

" Markdown Preview
" ****************
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" for path with space
" valid: `/path/with\ space/xxx`
" invalid: `/path/with\\ space/xxx`
" default: ''
let g:mkdp_browser = 'C:\Program Files\Google\Chrome\Application\chrome.exe'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0,
    \ 'toc': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or empty for random
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']

" set default theme (dark or light)
" By default the theme is define according to the preferences of the system
let g:mkdp_theme = 'dark'

" ****************

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

