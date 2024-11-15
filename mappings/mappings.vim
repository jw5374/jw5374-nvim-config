" Set leader key
let mapleader = " "

" General mappings
inoremap <A-j> <Esc>
vnoremap <A-j> <Esc>
nmap <A-z> :set wrap!<CR>

" center when page scrolling
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz

" move lines in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" preserve clipboard replace paste
vmap <leader>p "_dP

" copy to system clipboard
nnoremap <leader>y "+y
vmap <leader>y "+y
nnoremap <leader>Y "+Y

" delete without copy
nnoremap <leader>d "_d
vmap <leader>d "_d

" NERDTree 
nmap zb :NERDTreeToggle<CR> 

" FZF
" nmap <leader>f :FZF<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>s <cmd>Telescope grep_string<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

" [https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers]
" builtin.buffers -> Lists open buffers in current neovim instance
" builtin.quickfix -> Lists items in the quickfix list
" builtin.jumplist -> Lists Jump List entries
" builtin.current_buffer_fuzzy_find -> Live fuzzy search inside of the currently open buffer
" builtin.lsp_references -> Lists LSP references for word under the cursor
" builtin.lsp_incoming_calls -> Lists LSP incoming calls for word under the cursor
" builtin.lsp_outgoing_calls -> Lists LSP outgoing calls for word under the cursor
" builtin.diagnostics -> Lists Diagnostics for all open buffers or a specific buffer. Use option bufnr=0 for current buffer.
" builtin.lsp_implementations -> Goto the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope
" builtin.lsp_definitions -> Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope
" builtin.lsp_type_definitions -> Goto the definition of the type of the word under the cursor, if there's only one, otherwise show all options in Telescope
