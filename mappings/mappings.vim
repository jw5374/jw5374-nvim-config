" Set leader key
let mapleader = " "

" General mappings
inoremap <A-j> <Esc>
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
nmap <leader>f :FZF<CR>
