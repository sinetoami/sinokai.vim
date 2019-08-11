" =============================================================================
" Filename: autoload/lightline/colorscheme/sinokai.vim
" Author: Sinésio Santos da Silva Neto (sinetoami)
" License: MIT
" Last Change: 2019/06/25 03:04:51
" =============================================================================

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:red    = ['#ff443e', 160]
let s:green  = ['#a9dc76', 148]
let s:yellow = ['#ffd85b', 220]
let s:blue   = ['#78dce8', 81]
let s:purple = ['#ab9df2', 135]
let s:cyan   = ['#18ff9e', 73]
let s:white  = ['#ffffff', 255]

let s:dgray  = ['#19181A', 232]
let s:mgray  = ['#221f22', 232]
let s:lgray  = ['#929192', 255]

let s:darkestcyan = ['#005f5f', 23]
let s:mediumcyan  = ['#87dfff', 117]
let s:darkestblue = ['#005f87', 24]
let s:darkblue    = ['#0087af', 31]
let s:darkred     = ['#870000', 88]

let s:p.normal.left     = [ [s:dgray, s:green, 'bold'], [s:lgray, s:mgray] ]
let s:p.normal.middle   = [ [s:lgray, s:dgray] ]
let s:p.normal.right    = [ [s:dgray, s:green, 'bold'], [s:green, s:mgray], [s:lgray, s:dgray] ]
let s:p.normal.error    = [ [s:mgray, s:red] ]
let s:p.normal.warning  = [ [s:darkred, s:yellow] ]

let s:p.insert.left     = [ [s:darkestcyan, s:white, 'bold'], [s:mediumcyan, s:darkblue] ]
let s:p.insert.right    = [ [s:darkestblue, s:mediumcyan], [s:mediumcyan, s:darkblue], [s:mediumcyan, s:darkestblue] ]
let s:p.insert.middle   = [ [s:mediumcyan, s:darkestblue] ]

let s:p.visual.left     = [ [s:dgray, s:yellow, 'bold'], [s:lgray, s:mgray] ]
let s:p.visual.right    = [ [s:dgray, s:yellow, 'bold'], [s:yellow, s:mgray], [s:lgray, s:dgray] ]

let s:p.replace.left    = [ [s:dgray, s:red, 'bold'], [s:lgray, s:mgray] ]
let s:p.replace.middle  = [ [s:lgray, s:dgray] ]
let s:p.replace.right   = [ [s:dgray, s:red, 'bold'], [s:red, s:mgray], [s:lgray, s:dgray] ]

let s:p.tabline.left    = [ [s:green, s:mgray] ]
let s:p.tabline.tabsel  = [ [s:mgray, s:green, 'bold'] ]
let s:p.tabline.middle  = [ [s:lgray, s:dgray] ]
let s:p.tabline.right   = [ [s:lgray, s:mgray, 'bold'] ]

let s:p.inactive.left   = [ [s:lgray, s:mgray], [s:lgray, s:mgray] ]
let s:p.inactive.middle = [ [s:lgray, s:dgray] ]
let s:p.inactive.right  = [ [s:lgray, s:mgray], [s:lgray, s:mgray] ]

let g:lightline#colorscheme#sinokai#palette = lightline#colorscheme#flatten(s:p)
