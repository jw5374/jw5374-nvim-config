let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/AppData/Local/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
set stal=2
tabnew
tabnew
tabrewind
argglobal
if bufexists("term://~/AppData/Local/nvim//23452:C:/Windows/system32/cmd.exe") | buffer term://~/AppData/Local/nvim//23452:C:/Windows/system32/cmd.exe | else | edit term://~/AppData/Local/nvim//23452:C:/Windows/system32/cmd.exe | endif
if &buftype ==# 'terminal'
  silent file term://~/AppData/Local/nvim//23452:C:/Windows/system32/cmd.exe
endif
balt term://~/AppData/Local/nvim//23452:C:/Windows/system32/cmd.exe
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 8 - ((7 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 8
normal! 034|
lcd ~/AppData/Local/nvim
tabnext
edit ~/AppData/Local/nvim/init.vim
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/AppData/Local/nvim/mappings/mappings.vim
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 0
lcd ~/AppData/Local/nvim
tabnext
edit ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/script.js
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt ~/CodeProjects/CompSciClasses/OOP/HelloWorld.java
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let &fdl = &fdl
let s:l = 40 - ((16 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 40
normal! 07|
lcd ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02
tabnext 2
set stal=1
badd +4 ~/AppData/Local/nvim/init.vim
badd +23 term://~/AppData/Local/nvim//21676:C:/Windows/system32/cmd.exe
badd +43 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/script.js
badd +1 ~/AppData/Local/nvim/coc-settings.json
badd +2 ~/CodeProjects/CompSciClasses/OOP/HelloWorld.java
badd +16 ~/AppData/Local/nvim/general/settings.vim
badd +24 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/index.html
badd +68 ~/AppData/Local/nvim/vim-plug/plugs.vim
badd +23 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/style.css
badd +67 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/index.html
badd +24 ~/CodeProjects/KringleKonfidential/frontend/scripts/script.js
badd +1 ~/AppData/Local/nvim-data/plugged/nvim-treesitter/lockfile.json
badd +1 ~/AppData/Local/nvim/themes/lighthaus.vim
badd +1 ~/CodeProjects/KringleKonfidential/frontend/index.html
badd +1 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/micro_03/index.html
badd +1 ~/AppData/Local/nvim/sessions/getcwd()
badd +1 ~/AppData/Local/nvim/themes/miku.vim
badd +1 ~/AppData/Local/nvim/sessions/session.vim
badd +1 ~/AppData/Local/nvim/themes/abyss.vim
badd +1 ~/AppData/Local/nvim/themes/toast.vim
badd +1 ~/AppData/Local/nvim/themes/nokto.vim
badd +37 ~/CodeProjects/CompSciClasses/DataScience/P4.py
badd +25 ~/CodeProjects/CompSciClasses/OS/jw5374.c
badd +1 term://~/AppData/Local/nvim//20376:/
badd +1 term://~/AppData/Local/nvim//14564:C:/Windows/system32/cmd.exe
badd +1 term://~/AppData/Local/nvim//14780:++curwin
badd +1 term://~/AppData/Local/nvim//26528:C:/Windows/system32/cmd.exe
badd +8 ~/AppData/Local/nvim/NERD_tree_2
badd +11 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/NERD_tree_3
badd +1 term://~/AppData/Local/nvim//8412:C:/Windows/system32/cmd.exe
badd +12 term://~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev//16520:C:/Windows/system32/cmd.exe
badd +1 term://~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev//23284:C:/Windows/system32/cmd.exe
badd +0 term://~/AppData/Local/nvim//23452:C:/Windows/system32/cmd.exe
badd +1 ~/AppData/Local/nvim/mappings/mappings.vim
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOFI
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
nohlsearch
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
