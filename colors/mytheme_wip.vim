highlight clear

if exists("syntax_on")
    syntax reset
endif

set background=dark
let g:colors_name = "mytheme_wip"

" Colors: Xterm color numbers
"" Grayscale
let s:darkerblack = ["#080808", "232"]
let s:black       = ["#1c1c1c", "234"]
let s:lightblack  = ["#262626", "235"]
let s:darkergray  = ["#303030", "236"]
let s:darkgray    = ["#444444", "238"]
let s:gray        = ["#626262", "241"]
let s:white       = ["#e4e4e4", "254"]

"" Blue accent
let s:lightnavy   = ["#00d7ff", "045"]
let s:lighternavy = ["#5fffff", "087"]
let s:orange      = ["#af5f00", "130"]

let s:pine          = ["#5faf87", "072"]
let s:pink          = ["#ff0087", "198"]
let s:brightpink    = ["#ff5fd7", "206"]
let s:lightpurple   = ["#875f87", "096"]
let s:springgreen   = ["#00af5f", "035"]


"" Accents
let s:red     = ["#ff5f5f", "203"]
let s:green   = ["#87d75f", "113"]
let s:gold    = ["#ffd700", "220"]
let s:yellow  = ["#ffff5f", "227"]
let s:blue    = ["#87afd7", "110"]
let s:magenta = ["#afafd7", "146"]
let s:cyan    = ["#afd7af", "151"]
let s:brown   = ["#af875f", "137"]

" Link custom treesitter highlight groups
highlight! link @variable Identifier
highlight! link @property Constant

function! s:hl(group, attrs) abort
    if has_key(a:attrs, "fg")
        let a:attrs["guifg"] = a:attrs["fg"][0]
        let a:attrs["ctermfg"] = a:attrs["fg"][1]
        unlet a:attrs["fg"]
    endif

    if has_key(a:attrs, "bg")
        let a:attrs["guibg"] = a:attrs["bg"][0]
        let a:attrs["ctermbg"] = a:attrs["bg"][1]
        unlet a:attrs["bg"]
    endif

    if has_key(a:attrs, "style")
        let a:attrs["gui"] = a:attrs["style"]
        let a:attrs["cterm"] = a:attrs["style"]
        unlet a:attrs["style"]
    endif

    let l:defaults = { "guifg": "none", "guibg": "none", "gui": "none", "guisp": "none",
                     \ "ctermfg": "none", "ctermbg": "none", "cterm": "none" }
    call extend(l:defaults, a:attrs)

    let l:command = "highlight" . " " . a:group
    for name in keys(l:defaults)
        let l:command .= " " . name . "=" . l:defaults[name]
    endfor

    execute l:command
endfunction

function! s:merge(arg1, arg2, ...) abort
    let l:result = copy(a:arg1)
    call call("extend", [l:result, a:arg2] + a:000)
    return l:result
endfunction

" Test highlighting with `:source $VIMRUNTIME/syntax/hitest.vim`
" and `:help group-name`

let s:fg       =            { "fg": s:white }
let s:comment  =            { "fg": s:lightpurple }
let s:preproc  =            { "fg": s:brightpink }
let s:keyword  =            { "fg": s:lightnavy, "style": "bold" }
let s:type     =            { "fg": s:lighternavy }
let s:function =            { "fg": s:pine }
let s:literal  =            { "fg": s:springgreen }
let s:string   =            { "fg": s:magenta }
let s:char     =            { "fg": s:brightpink }
let s:const     =           { "fg": s:pink }
let s:ital     =            { "style": "italic" }
let s:bold     =            { "style": "bold" }

" Modes
call s:hl("Normal",         { "fg": s:white, "bg": s:darkerblack })
highlight! link NormalFloat Normal
highlight! link NormalNC    Normal
highlight! link MsgArea     Normal

call s:hl("Visual",         { "bg": s:orange })
highlight! link VisualNOS   Visual

" Syntax
call s:hl("Comment",        s:comment)
call s:hl("Constant",       s:const)
call s:hl("String",         s:string)
call s:hl("Character",      s:char)
call s:hl("Number",         s:literal)
call s:hl("Boolean",        s:literal)
call s:hl("Float",          s:literal)
call s:hl("Identifier",     s:fg)
call s:hl("Function",       s:function)
call s:hl("Statement",      s:keyword)
call s:hl("Operator",       s:type)
call s:hl("PreProc",        s:preproc)
call s:hl("Type",           s:type)
call s:hl("Special",        s:type)
call s:hl("SpecialChar",    s:char)
call s:hl("SpecialComment", s:merge(s:comment, s:ital))
call s:hl("Underlined",     { "style": "underline" })
call s:hl("Ignore",         { "fg": s:black })
call s:hl("Error",          { "fg": s:red })
call s:hl("Todo",           s:merge(s:literal, s:bold))

" Cursor
call s:hl("Cursor",         { "fg": s:black, "bg": s:white })
call s:hl("TermCursorNC",   { "fg": s:black, "bg": s:gray })
highlight! link lCursor     Cursor
highlight! link CursorIM    Cursor
highlight! link TermCursor  Cursor

call s:hl("CursorLine",     { "bg": s:lightblack })
highlight! link CursorColumn CursorLine

call s:hl("CursorLineNr",   { "fg": s:lightnavy, "style": "bold" })

" Line numbers
call s:hl("LineNr",         { "fg": s:gray })
call s:hl("SignColumn",     { "bg": s:darkerblack })

" Status line
call s:hl("StatusLine",     { "fg": s:white, "bg": s:lightblack })
call s:hl("StatusLineNC",   { "fg": s:gray, "bg": s:lightblack })

" Search
call s:hl("Search",         { "fg": s:white, "bg": s:gray })
call s:hl("IncSearch",      { "fg": s:black, "bg": s:lightnavy, "style": "bold" })
highlight! link CurSearch IncSearch

" Completion
call s:hl("Pmenu",          { "fg": s:white, "bg": s:darkgray })
" call s:hl("PmenuKind",      { "fg": s:white, "bg": s:darkgray })
" call s:hl("PmenuExtra",     { "fg": s:white, "bg": s:darkgray })
call s:hl("PmenuSel",       { "fg": s:white, "bg": s:gray, "style": "bold" })
call s:hl("PmenuSBar",      { "bg": s:darkgray })
call s:hl("PmenuThumb",     { "bg": s:gray })
call s:hl("WildMenu",       { "fg": s:white, "bg": s:gray, "style": "bold" })

" Tabs
call s:hl("TabLine",        { "fg": s:gray, "bg": s:lightblack })
highlight! link TabLineFill TabLine

call s:hl("TabLineSel",     { "fg": s:white, "style": "bold,italic" })
call s:hl("Title",          { "fg": s:lightnavy, "style": "bold" })

" Diff
call s:hl("DiffAdd",        { "fg": s:magenta })
call s:hl("DiffDelete",     { "fg": s:red })
call s:hl("DiffChange",     { "fg": s:pine })
call s:hl("DiffText",       { "style": "bold" })

" Messages
call s:hl("ModeMsg",        { "style": "bold" })
call s:hl("MsgSeparator",   { "fg": s:gray })
call s:hl("ErrorMsg",       { "fg": s:red })
call s:hl("WarningMsg",     { "fg": s:lightnavy })
call s:hl("MoreMsg",        { "fg": s:magenta })
call s:hl("Question",       { "fg": s:magenta })

" Spell
call s:hl("SpellBad",       { "style": "underline" })
call s:hl("SpellCap",       { "style": "underline" })
call s:hl("SpellLocal",     { "style": "undercurl" })
call s:hl("SpellRare",      { "style": "underdotted" })

" Folding
call s:hl("Folded",         { "fg": s:lightpurple, "bg": s:lightblack , "style": "italic" })
call s:hl("FoldColumn",     { "fg": s:lightpurple })

" Diagnostic
call s:hl("DiagnosticError",         { "fg": s:red })
call s:hl("DiagnosticWarn",          { "fg": s:lightnavy })
call s:hl("DiagnosticInfo",          { "fg": s:brightpink })
call s:hl("DiagnosticHint",          { "fg": s:gray })
call s:hl("DiagnosticUnderlineError",{ "fg": s:red, "style": "undercurl" })
call s:hl("DiagnosticUnderlineWarn", { "fg": s:black, "bg": s:lighternavy, "style": "undercurl" })

" Indentation
call s:hl("ColorColumn",    { "bg": s:lightblack })
call s:hl("NonText",        { "fg": s:darkgray })
call s:hl("Whitespace",     { "fg": s:darkergray })

" Splits
call s:hl("VertSplit",      { "fg": s:gray })
call s:hl("WinSeparator",   { "fg": s:gray })

" WinBar
call s:hl("WinBar",         { "fg": s:springgreen, "style": "bold" })
highlight! link WinBarNC    WinBar

" Misc
call s:hl("MatchParen",     { "fg": s:white, "bg": s:pine, "style": "bold" })
call s:hl("QuickFixLine",   { "bg": s:gray, "style": "bold" })
call s:hl("SpecialKey",     { "fg": s:springgreen })
call s:hl("Conceal",        { "fg": s:springgreen })
call s:hl("Directory",      { "fg": s:pine })
call s:hl("EndOfBuffer",    { "fg": s:darkergray })

call s:hl("NvimInternalError", { "fg": s:black, "bg": s:red })

" Lightline??
" Lighthaus Color theme for Vim Lightline
" GIT: https://github.com/lighthaus-theme/vim
" Author: Adhiraj Sirohi (https://github.com/brutuski)
"         Vasundhara Sharma (https://github.com/vasundhasauras)

" Copyright © 2020-Present Lighthaus Theme
" Copyright © 2020-Present Adhiraj Sirohi
" Copyright © 2020-Present Vasundhara Sharma

let s:lighthaus_vim_v='1.0.0'


let s:lhbg  = s:darkerblack " ['#21252D', '234']
let s:lhnfg = ['#00BFA4', '43']
let s:lhifg = ['#50C16E', '71']
let s:lhvfg = ['#ED722E', '208']
let s:lhrfg = ['#FF5050', '203']
let s:lh03  = ['#FFFADE', '230']
let s:lh04  = ['#090B26', '233']
let s:lh08  = ['#CCCCCC', '188']
let s:lh09  = ['#FC2929', '196']
let s:lh10  = ['#FF4D00', '202']


let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" Example format -> let s:p.{mode}.{where} = [ [ {guifg}, {guibg}, {ctermfg}, {ctermbg} ], ... ]
" Each nested array is associated with a component section in the lightline
" init config
let s:p.normal.left     = [ [ s:lhbg, s:lhnfg ], [ s:lhnfg, s:lhbg ] ]
let s:p.normal.middle   = [ [ s:lhnfg, s:lhbg ] ]
let s:p.normal.right    = [ [ s:lhbg, s:lhnfg ], [ s:lhnfg, s:lhbg ] ]
let s:p.normal.error    = [ [ s:lh09, s:lhbg ] ]
let s:p.normal.warning  = [ [ s:lhrfg, s:lhbg ] ]

let s:p.inactive.left   = [ [ s:lhbg, s:lh08 ], [ s:lhifg, s:lhbg ] ]
let s:p.inactive.middle = [ [ s:lhifg, s:lhbg ] ]
let s:p.inactive.right  = [ [ s:lhifg, s:lhbg ], [ s:lhifg, s:lhbg ], [ s:lhifg, s:lhbg ] ]

let s:p.insert.left     = [ [ s:lhbg, s:lhifg ], [ s:lhifg, s:lhbg ] ]
let s:p.insert.middle   = [ [ s:lhbg, s:lhifg ], [ s:lhbg, s:lhifg ] ]
let s:p.insert.right    = [ [ s:lhbg, s:lhifg ], [ s:lhifg, s:lhbg ], [ s:lhifg, s:lhbg ] ]

let s:p.replace.left    = [ [ s:lhbg, s:lhrfg ], [ s:lhrfg, s:lhbg ] ]
let s:p.replace.middle  = [ [ s:lhbg, s:lhrfg ], [ s:lhbg, s:lhrfg ] ]
let s:p.replace.right   = [ [ s:lhbg, s:lhrfg ], [ s:lhrfg, s:lhbg ], [ s:lhrfg, s:lhbg ] ]

let s:p.visual.left     = [ [ s:lhbg, s:lhvfg ], [ s:lhvfg, s:lhbg ] ]
let s:p.visual.middle   = [ [ s:lhbg, s:lhvfg ], [ s:lhbg, s:lhvfg ] ]
let s:p.visual.right    = [ [ s:lhbg, s:lhvfg ], [ s:lhvfg, s:lhbg ], [ s:lhvfg, s:lhbg ] ]

let s:p.tabline.left    = [ [ s:lh08, s:lhbg ] ]
let s:p.tabline.middle  = [ [ s:lh08, s:lhbg ] ]
let s:p.tabline.right   = [ [ s:lh09, s:lhbg ] ]
let s:p.tabline.tabsel  = [ [ s:lh10, s:lh04 ] ]

let g:lightline#colorscheme#{g:colors_name}#palette = lightline#colorscheme#flatten(s:p)
