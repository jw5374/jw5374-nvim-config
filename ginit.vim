let g:nvim_config_root = stdpath('config')
let g:config_file_list = ['vim-plug\zoom.vim']

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . '\' . f
endfor

execute 'GuiFont! Iosevka\ NF:h16'
GuiTabline 0

