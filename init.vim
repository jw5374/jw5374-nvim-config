let g:python3_host_prog = 'C:/Python310/python'
let g:nvim_config_root = stdpath('config')
let g:config_file_list = ['general\settings.vim',
    \ 'mappings\mappings.vim',
    \ 'vim-plug\plugs.vim',
    \ 'themes\gruber.vim'
    \ ]

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . '\' . f
endfor

" cursors
highlight nCursor guibg=#00A356 guifg=cyan
highlight vCursor guibg=#FF2D00
highlight iCursor guibg=cyan
set guicursor=n-c:block-nCursor
set guicursor+=v:block-vCursor
set guicursor+=i:block-iCursor
set guicursor+=i:blinkwait50-blinkoff50-blinkon1000

