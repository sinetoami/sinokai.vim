" =============================================================================
" Plugin Name: sinokai.vim
" Author:      Sinésio Neto (sinetoami) <sinetoami [at] gmail [dot] com>
" Version:     0.0.1 - 2019 Jun 20
" License:     MIT
" Description: Another color scheme for Vim.
" =============================================================================
hi clear 

if exists("syntax_on")
  syntax reset
endif

let s:style = get(g:, 'sinokai_color', 'dark')
let g:colors_name = "sinokai"

" Highlight Functions ---------------------------------------------------- {{{
function! s:hifor(list, region_group)
  for group in a:list
    exec 'hi link ' . group . ' ' . a:region_group
  endfor
endfunction

" Group (cterm|gui)fg (cterm|gui)bg (cterm|gui) guisp
function! s:hi( group, fg, bg, attr, ... )
  " fg - ctermfg|guifg
  if !empty(a:fg)
    execute 'hi ' . a:group . ' ctermfg=' . a:fg.cterm
    execute 'hi ' . a:group . ' guifg='   . a:fg.gui
  endif

  " bg - ctermbg|guibg
  if !empty(a:bg)
    execute 'hi ' . a:group . ' ctermbg=' . a:bg.cterm
    execute 'hi ' . a:group . ' guibg='   . a:bg.gui
  endif

  " attr - cterm|gui
  if !empty(a:attr)
    execute 'hi ' . a:group . ' cterm=' . a:attr
    execute 'hi ' . a:group . ' gui='   . a:attr
  endif

  " guisp
  if !empty(a:0)
    execute 'hi ' . a:group . ' guisp=' . a:1
  else
    " if not receive argument, set guisp to be 'none'
    execute 'hi ' . a:group . ' guisp=none'
  endif
endfunction
" }}}

" Default Colors {{{
let s:fg = { 'gui': '#ffffff', 'cterm': '255' }
let s:bg = { 'gui': '#2d2a2e', 'cterm': '234' }

let s:black  = { "gui": "#2d2a2e", "cterm": "234" }
let s:red    = { "gui": "#ff443e", "cterm": "160" }
let s:green  = { "gui": "#a9dc76", "cterm": "148" }
let s:yellow = { "gui": "#ffd85b", "cterm": "220" }
let s:blue   = { "gui": "#78dce8", "cterm": "81"  }
let s:purple = { "gui": "#ab9df2", "cterm": "135" }
let s:cyan   = { "gui": "#18ff9e", "cterm": "73"  }
let s:white  = { "gui": "#dcdfe4", "cterm": "188" }
" }}}

" Custom Colors {{{
let s:yellowb   = { 'gui': '#ffe48f', 'cterm': '220' }
let s:yellowc   = { 'gui': '#ff8c8c', 'cterm': '203' }
let s:purplenr  = { 'gui': '#c678dd', 'cterm': '175' }
let s:purplebl  = { 'gui': '#af87ff', 'cterm': '141' }
let s:pink      = { 'gui': '#ff6188', 'cterm': '197' }
let s:orange    = { 'gui': '#FC9867', 'cterm': '206' }

let s:darkgray  = { 'gui': '#19181A', 'cterm': '235' }
let s:deepgray  = { 'gui': '#221f22', 'cterm': '237' }
let s:midgray   = { 'gui': '#353535', 'cterm': '236' }
let s:lowgray   = { 'gui': '#929192', 'cterm': '248' }
let s:lightgray = { 'gui': '#bbbbbb', 'cterm': '250' }
let s:sgray     = { 'gui': '#3C393D', 'cterm': '250' }

let s:select    = { 'gui': '#434144', 'cterm': '237' }

let s:linenr    = { 'gui': '#727072', 'cterm': '237' }
let s:cursorln  = { 'gui': '#383539', 'cterm': '236' }

let s:menusel   = { 'gui': '#2D2A2E', 'cterm': '235' }
let s:menutmb   = { 'gui': '#4D4C4E', 'cterm': '239' }
" }}}

" Style Font Attributes {{{
let s:attr = { 
 \ 'n': 'none', 
 \ 'i': 'italic', 
 \ 'b': 'bold', 
 \ 'u': 'underline',
 \ 'bi': 'bold,italic', 
 \ 'bu': 'bold,underline', 
 \ 'iu': 'italic,underline',
 \ 'biu': 'bold,italic,underline',
\}
" }}}

" These are supposedly colors for Neovim's terminal emulator {{{
if has('nvim')
  let g:terminal_color_0 = s:black.gui
  let g:terminal_color_1 = s:red.gui
  let g:terminal_color_2 = s:green.gui
  let g:terminal_color_3 = s:yellow.gui
  let g:terminal_color_4 = s:blue.gui
  let g:terminal_color_5 = s:purple.gui
  let g:terminal_color_6 = s:cyan.gui
  let g:terminal_color_7 = s:white.gui
  let g:terminal_color_8 = s:black.gui
  let g:terminal_color_9 = s:red.gui
  let g:terminal_color_10 = s:green.gui
  let g:terminal_color_11 = s:yellow.gui
  let g:terminal_color_12 = s:blue.gui
  let g:terminal_color_13 = s:purple.gui
  let g:terminal_color_14 = s:cyan.gui
  let g:terminal_color_15 = s:white.gui
  let g:terminal_color_background = s:bg.gui
  let g:terminal_color_foreground = s:fg.gui
endif
" }}}

" NORMAL ----------------------------------------------------------------- {{{
call s:hi('Normal', s:fg, s:bg, '')
call s:hi('NonText', s:fg, s:bg, '')
call s:hi('SpecialKey', s:purple, '', '')
call s:hi('EndOfBuffer', s:linenr, '', '')
" }}}

" VISUAL ----------------------------------------------------------------- {{{
call s:hi('Visual', '', s:select, '')
call s:hi('VisualNOS', '', s:select, '')
" }}}

" CURSOR ----------------------------------------------------------------- {{{
call s:hi('Cursor', s:bg, s:select, '')
call s:hi('CursorColumn', '', s:cursorln, '')
call s:hi('CursorLine', '', s:cursorln, '')
" }}}

" LINE NUMBER ------------------------------------------------------------ {{{
call s:hi('LineNr', s:linenr, '', '')
call s:hi('CursorLineNr', s:fg, s:cursorln, s:attr.b)
" }}}

" SEARCH ----------------------------------------------------------------- {{{
call s:hi('Search', s:fg, s:linenr, '')
call s:hi('IncSearch', s:bg, s:yellow, '')
call s:hi('MatchParen', s:fg, s:linenr, s:attr.u)
" }}}

" PMENU ------------------------------------------------------------------ {{{
call s:hi('Pmenu', s:lowgray, s:deepgray, '')
call s:hi('PmenuSel', s:fg, s:menusel, '')
call s:hi('PmenuSbar', '', s:deepgray, '')
call s:hi('PmenuThumb', '', s:menutmb, '')
" }}}

" SPELLCHECK ------------------------------------------------------------- {{{
call s:hi('SpellBad', s:red, '', '')
call s:hi('SpellCap', s:yellow, '', '')
call s:hi('SpellLocal', s:yellow, '', '')
call s:hi('SpellRare', s:yellow, '', '')
" }}}

" MISC ------------------------------------------------------------------- {{{
call s:hi('Folded', s:linenr, s:bg, '')
call s:hi('FoldColumn', s:linenr, s:bg, '')
call s:hi('SignColumn', s:red, s:bg, s:attr.b)
call s:hi('ColorColumn', '', s:cursorln, '')
call s:hi('Conceal', s:fg, '', '')
call s:hi('Directory', s:blue, '', '')
" }}}

" STATUSLINE, TABLINE, SPLITS -------------------------------------------- {{{
call s:hi('StatusLine', s:lowgray, s:deepgray , s:attr.n)
call s:hi('StatusLineNC', s:lowgray, s:deepgray, s:attr.b)
call s:hi('WildMenu', s:deepgray, s:yellow, s:attr.b)
call s:hi('TabLine', s:green, s:deepgray, '')
call s:hi('TabLineFill', s:deepgray, s:fg, '')
call s:hi('TabLineSel', s:deepgray, s:green, '')
call s:hi('VertSplit', s:bg, s:darkgray, '')
" }}}

" MESSAGES --------------------------------------------------------------- {{{
call s:hi('ModeMsg', s:fg, s:bg, s:attr.b)
call s:hi('ErrorMsg', s:red, s:bg, s:attr.b)
call s:hi('WarningMsg', s:yellow, s:bg, s:attr.b)
call s:hi('MoreMsg', s:green, s:bg, s:attr.b)
call s:hi('Question', s:green, '', '')
call s:hi('Title', s:green, '', '')
" }}}

" DIFF ------------------------------------------------------------------- {{{
call s:hi('DiffAdd', s:green, '', '')
call s:hi('DiffChange', s:yellow, '', '')
call s:hi('DiffDelete', s:red, '', '')
call s:hi('DiffText', s:blue, '', '')
" }}}

" ··········································································· "

" DEFAULT SYNTAX COLORS -------------------------------------------------- {{{
call s:hi('Comment', s:linenr, '', s:attr.i)
call s:hi('Constant',s:cyan, '', s:attr.n)
call s:hi('String', s:yellow, '', '')
call s:hi('Character', s:purple, '', '')
call s:hi('Number', s:purplenr, '', '')
call s:hi('Float', s:purplenr, '', '')
call s:hi('Boolean', s:purplebl, '', '')

call s:hi('Identifier', s:green, '', s:attr.n)
call s:hi('Function', s:green, '', s:attr.n)
call s:hi('Statement', s:pink, '', s:attr.n)

call s:hi('Conditional', s:pink, '', '')
call s:hi('Repeat', s:pink, '', '')
call s:hi('Label', s:pink, '', '')
call s:hi('Operator', s:pink, '', '')
call s:hi('Keyword', s:pink, '', '')
call s:hi('Exception', s:pink, '', '')

call s:hi('PreProc', s:pink, '', '')
call s:hi('Include', s:pink, '', '')
call s:hi('Define', s:pink, '', '')
call s:hi('Macro', s:pink, '', '')
call s:hi('PreCondit', s:pink, '', '')

call s:hi('Type', s:green, '', s:attr.n)
call s:hi('StorageClass', s:blue, '', s:attr.i)
call s:hi('Structure', s:green, '', '')
call s:hi('TypeDef', s:green, '', '')

call s:hi('Special', s:purple, '', '')
call s:hi('SpecialChar', s:lowgray, '', '')
call s:hi('Tag', s:red, '', '')
call s:hi('Delimiter', s:lowgray, '', '')
call s:hi('Brackets', s:lowgray, '', '')
call s:hi('SpecialComment', s:linenr, '', '')
call s:hi('Debug', s:red, '', '')
call s:hi('Todo', s:linenr, s:bg, s:attr.bu)
call s:hi('Underlined', '', '', s:attr.u)
" }}}

" RUBY ------------------------------------------------------------------- {{{
call s:hi('rubyPseudoOperator', s:lightgray, '', '')
call s:hi('rubySuperClassOperator', s:lightgray, '', '')
call s:hi('rubyLambdaOperator', s:pink, '', '')
call s:hi('rubySplatOperator', s:pink, '', '')
call s:hi('rubyDoubleSplatOperator', s:pink, '', '')
call s:hi('rubyInterpolationDelimiter', s:yellowc, '', '')

call s:hi('rubyConstant', s:blue, '', '')
call s:hi('rubyClassName', s:green, '', '')
call s:hi('rubyModuleName',s:green, '', '')
call s:hi('rubyCapitalizedMethod', s:blue, '', '')
call s:hi('rubySymbol', s:purple, '', '')

call s:hi('rubyPredefinedVariable', s:fg, '', '')
call s:hi('rubyPredefinedConstant', s:purple, '', '')
call s:hi('rubyPseudoVariable', s:orange, '', s:attr.i)
" }}}

" GO ---------------------------------------------------------------------- {{{
call s:hi('goType', s:blue, '', s:attr.i)
call s:hi('goSignedInts', s:blue, '', s:attr.i)
call s:hi('goUnsignedInts', s:blue, '', s:attr.i)
call s:hi('goUnsignedInts', s:blue, '', s:attr.i)
call s:hi('goFloats', s:blue, '', s:attr.i)
" }}}

" HTML ------------------------------------------------------------------- {{{
call s:hi('htmlTag', s:lowgray, '', '')
call s:hi('htmlEndTag', s:lowgray, '', '')
call s:hi('htmlStringDeli', s:blue, '', '')
call s:hi('htmlTitle', s:fg, '', '')
call s:hi('htmlLink', s:fg, '', '')
call s:hi('htmlH1', s:fg, '', '')
call s:hi('htmlH2', s:fg, '', '')
call s:hi('htmlH3', s:fg, '', '')
call s:hi('htmlH4', s:fg, '', '')
call s:hi('htmlH5', s:fg, '', '')
call s:hi('htmlH6', s:fg, '', '')
" }}}

" SHELL ------------------------------------------------------------------- {{{
call s:hi('shSetList', s:fg, '', '')
call s:hi('shVarAssign', s:pink, '', '')
call s:hi('shDeref', s:fg, '', '')
call s:hi('shDerefPattern', s:yellow, '', '')
call s:hi('shParen', s:purple, '', '')
call s:hi('shQuote', s:lowgray, '', '')
call s:hi('shFunctionKey', s:blue, '', '')
call s:hi('shStatement', s:pink, '', '')
call s:hi('shLoop', s:pink, '', '')
" }}}

" ZSH --------------------------------------------------------------------- {{{
call s:hi('zshFunction', s:green, '', '')
call s:hi('zshStringDelimiter', s:lowgray, '', '')
call s:hi('zshOperator', s:pink, '', '')
call s:hi('zshDereferencing', s:yellowc, '', '')
call s:hi('zshOption', s:purple, '', '')
call s:hi('zshTypes', s:pink, '', '')
call s:hi('zshSubstDelim', s:lowgray, '', '')
" }}}

" MARKDOWN ---------------------------------------------------------------- {{{
call s:hi('markdownH1', s:yellow, '', '')
call s:hi('markdownH2', s:yellow, '', '')
call s:hi('markdownH3', s:yellow, '', '')
call s:hi('markdownH4', s:yellow, '', '')
call s:hi('markdownH5', s:yellow, '', '')
call s:hi('markdownH6', s:yellow, '', '')
call s:hi('markdownCode', s:yellow, '', '')
call s:hi('markdownListMarker', s:lowgray, '', '')
call s:hi('markdownBoldDelimiter', s:lowgray, '', '')
call s:hi('markdownItalicDelimiter', s:lowgray, '', '')
call s:hi('markdownId', s:green, '', '')
call s:hi('markdownIdDeclaration', s:pink, '', '')
call s:hi('markdownIdDelimiter', s:lowgray, '', '')
call s:hi('markdownUrl', s:green, '', '')
call s:hi('markdownUrlDelimiter', s:lowgray, '', '')
call s:hi('markdownUrlTitleDelimiter', s:lowgray, '', '')
call s:hi('markdownLinkText', s:pink, '', '')
call s:hi('markdownLinkTextDelimiter', s:lowgray, '', '')
call s:hi('markdownLinkDelimiter', s:lowgray, '', '')
" }}}

let &background = s:style
