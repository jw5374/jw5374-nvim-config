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
Plug 'akinsho/toggleterm.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

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
      \   'time': '%{strftime("%c")}'
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

" indent blankline
lua <<EOF
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" ToggleTerm
lua <<EOF
function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'horizontal',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  -- This field is only relevant if direction is set to 'float'
  --  float_opts = {
  --    -- The border key is *almost* the same as 'nvim_open_win'
  --    -- see :h nvim_open_win for details on borders however
  --    -- the 'curved' border is a custom border type
  --    -- not natively supported but implemented in this plugin.
  --    border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
  --    width = <value>,
  --    height = <value>,
  --    winblend = 3,
  --    highlights = {
  --      border = "Normal",
  --      background = "Normal",
  --    }
  --}
}
EOF

