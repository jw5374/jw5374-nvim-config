let g:python3_host_prog = 'C:/Python310/python'
let g:nvim_config_root = stdpath('config')

execute 'source ' . g:nvim_config_root . '\' . 'general\settings.vim'
execute 'source ' . g:nvim_config_root . '\' . 'mappings\mappings.vim'
execute 'source ' . g:nvim_config_root . '\' . 'vim-plug\plugs.vim'

" cursors
highlight nCursor guibg=#00A356 guifg=cyan
highlight vCursor guibg=#FF2D00
highlight iCursor guibg=cyan
set guicursor=n-c:block-nCursor
set guicursor+=v:block-vCursor
set guicursor+=i:block-iCursor
set guicursor+=i:blinkwait50-blinkoff50-blinkon1000
set termguicolors

colorscheme mytheme_wip
