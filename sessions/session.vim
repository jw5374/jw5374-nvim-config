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
tabnew
tabrewind
edit general/settings.vim
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
let s:l = 1 - ((0 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
normal! 0
lcd ~/AppData/Local/nvim/general
tabnext
edit ~/AppData/Local/nvim-data/plugged/vim-lighthaus/colors/lighthaus.vim
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
balt ~/AppData/Local/nvim-data/plugged/vim-lighthaus/colors/lighthaus.vim
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
let s:l = 186 - ((6 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 186
normal! 0
lcd ~/AppData/Local/nvim-data/plugged/vim-lighthaus/colors
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
balt ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/script.js
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
let s:l = 3 - ((2 * winheight(0) + 10) / 21)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 012|
lcd ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02
tabnext
edit ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/database/datafetch.js
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
balt ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/android/build.gradle
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
let s:l = 70 - ((14 * winheight(0) + 14) / 29)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 70
normal! 010|
lcd ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/database
tabnext 1
set stal=1
badd +86 ~/AppData/Local/nvim/vim-plug/plugs.vim
badd +1 ~/AppData/Local/nvim-data/plugged/vim-lighthaus/colors/lighthaus.vim
badd +1 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/script.js
badd +70 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/database/datafetch.js
badd +0 ~/AppData/Local/nvim/vim-plug/vim-plug/themes/lighthaus.vim
badd +7 ~/AppData/Local/Temp/nvimrzjH9Y/7
badd +1 ~/AppData/Local/nvim/vim-plug/themes/lighthaus.vim
badd +967 ~/AppData/Local/nvim-data/plugged/lightline.vim/doc/lightline.txt
badd +1 ~/AppData/Local/nvim/vim-plug/vim-plug/autoload/plug.vim
badd +1 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/style.css
badd +1 ~/AppData/Local/nvim/vim-plug/autoload/plug.vim
badd +9 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/index.html
badd +5 ~/AppData/Local/nvim/init.vim
badd +1 ~/AppData/Local/nvim/autoload/plug.vim
badd +2 ~/CodeProjects/CompSciClasses/OOP/HelloWorld.java
badd +23 term://~/AppData/Local/nvim//21676:C:/Windows/system32/cmd.exe
badd +1 ~/AppData/Local/nvim/coc-settings.json
badd +13 ~/AppData/Local/nvim/general/settings.vim
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
badd +1 term://~/AppData/Local/nvim//8412:C:/Windows/system32/cmd.exe
badd +12 term://~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev//16520:C:/Windows/system32/cmd.exe
badd +1 term://~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev//23284:C:/Windows/system32/cmd.exe
badd +8 term://~/AppData/Local/nvim//23452:C:/Windows/system32/cmd.exe
badd +1 ~/AppData/Local/nvim/mappings/mappings.vim
badd +1 ~/AppData/Local/nvim/.gitignore
badd +2 ~/AppData/Local/nvim-data/plugged/vim-lighthaus/assets/airline.png
badd +230 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/signup.js
badd +6 ~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02/NERD_tree_5
badd +85 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/confirmation.js
badd +50 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/docCapture.js
badd +19 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/android/build.gradle
badd +46 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/dashboard.js
badd +121 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/login.js
badd +4 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/users/index.js
badd +16 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/users/../../lib/jwt.js
badd +23 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/users/../../lib/./sessions.js
badd +6 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/users/../../lib/./../db/sessions.js
badd +4 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/users/./insertUserHandler.js
badd +6 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/auth/index.js
badd +24 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/auth/./requestOTP.js
badd +1 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/auth/./verifyOTP.js
badd +7 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/auth/./login.js
badd +1 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/users/uploadKycDetails.js
badd +36 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/users/../../lib/kycModule/kyc.js
badd +28 ~/CodeProjects/SmartIDShoptaki/Dashboard-backend/routes/users/../../db/users.js
badd +18 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/home/settings.js
badd +1 term://~/CodeProjects/CompSciClasses/WebDevelopment/MAMP/webdev/assignments/macro_02//9940:C:/Windows/system32/cmd.exe
badd +60 term://~/CodeProjects/SmartIDShoptaki/Smartid-app//14348:C:/Windows/system32/cmd.exe
badd +22 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/android/gradle.properties
badd +1 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/android/settings.gradle
badd +1 ~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/android/local.properties
badd +15 term://~/CodeProjects/SmartIDShoptaki/Smartid-app/reactnative_mobile/components/database//18512:C:/Windows/system32/cmd.exe
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
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
