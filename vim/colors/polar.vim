if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name = "polar"
set background=light

let s:polar0_gui = "#ECEFF4"
let s:polar1_gui = "#E5E9F0"
let s:polar2_gui = "#D8DEE9"
let s:polar3_gui = "#D8DEE9"
let s:polar4_gui = "#4C566A"
let s:polar5_gui = "#434C5E"
let s:polar6_gui = "#2E3440"
let s:polar7_gui = "#67ABA9"
let s:polar8_gui = "#88C0D0"
let s:polar9_gui = "#658DB5"
let s:polar10_gui = "#658DB5"
let s:polar11_gui = "#BF616A"
let s:polar12_gui = "#D08770"
let s:polar13_gui = "#E2BD72"
let s:polar14_gui = "#88AC69"
let s:polar15_gui = "#A4779C"

let s:polar1_term = "0"
let s:polar3_term = "8"
let s:polar5_term = "7"
let s:polar6_term = "15"
let s:polar7_term = "14"
let s:polar8_term = "6"
let s:polar9_term = "4"
let s:polar10_term = "12"
let s:polar11_term = "1"
let s:polar12_term = "11"
let s:polar13_term = "3"
let s:polar14_term = "2"
let s:polar15_term = "5"

let s:polar3_gui_brightened = [
  \ s:polar3_gui,
  \ "#4e586d",
  \ "#505b70",
  \ "#525d73",
  \ "#556076",
  \ "#576279",
  \ "#59647c",
  \ "#5b677f",
  \ "#5d6982",
  \ "#5f6c85",
  \ "#616e88",
  \ "#63718b",
  \ "#66738e",
  \ "#687591",
  \ "#6a7894",
  \ "#6d7a96",
  \ "#6f7d98",
  \ "#72809a",
  \ "#75829c",
  \ "#78859e",
  \ "#7b88a1",
\ ]

if !exists("g:polar_italic")
  if has("gui_running") || $TERM_ITALICS == "true"
    let g:polar_italic=1
  else
    let g:polar_italic=0
  endif
endif

let s:italic = "italic,"
if g:polar_italic == 0
  let s:italic = ""
endif

let s:underline = "underline,"
if ! get(g:, "polar_underline", 1)
  let s:underline = "NONE,"
endif

let s:italicize_comments = ""
if exists("g:polar_italic_comments")
  if g:polar_italic_comments == 1
    let s:italicize_comments = s:italic
  endif
endif

if !exists('g:polar_uniform_status_lines')
  let g:polar_uniform_status_lines = 0
endif

if !exists("g:polar_comment_brightness")
  let g:polar_comment_brightness = 0
endif

if !exists("g:polar_uniform_diff_background")
  let g:polar_uniform_diff_background = 0
endif

if !exists("g:polar_cursor_line_number_background")
  let g:polar_cursor_line_number_background = 0
endif

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

"+---------------+
"+ UI Components +
"+---------------+
"+--- Attributes ---+
call s:hi("Bold", "", "", "", "", "bold", "")
call s:hi("Italic", "", "", "", "", s:italic, "")
call s:hi("Underline", "", "", "", "", s:underline, "")

"+--- Editor ---+
call s:hi("ColorColumn", "", s:polar1_gui, "NONE", s:polar1_term, "", "")
call s:hi("Cursor", s:polar0_gui, s:polar4_gui, "", "NONE", "", "")
call s:hi("CursorLine", "", s:polar1_gui, "NONE", s:polar1_term, "NONE", "")
call s:hi("Error", s:polar0_gui, s:polar11_gui, "", s:polar11_term, "", "")
call s:hi("iCursor", s:polar0_gui, s:polar4_gui, "", "NONE", "", "")
call s:hi("LineNr", s:polar3_gui, s:polar0_gui, s:polar3_term, "NONE", "", "")
call s:hi("MatchParen", s:polar8_gui, s:polar3_gui, s:polar8_term, s:polar3_term, "", "")
call s:hi("NonText", s:polar2_gui, "", s:polar3_term, "", "", "")
call s:hi("Normal", s:polar4_gui, s:polar0_gui, "NONE", "NONE", "", "")
call s:hi("PMenu", s:polar4_gui, s:polar2_gui, "NONE", s:polar1_term, "NONE", "")
call s:hi("PmenuSbar", s:polar4_gui, s:polar2_gui, "NONE", s:polar1_term, "", "")
call s:hi("PMenuSel", s:polar8_gui, s:polar3_gui, s:polar8_term, s:polar3_term, "", "")
call s:hi("PmenuThumb", s:polar8_gui, s:polar3_gui, "NONE", s:polar3_term, "", "")
call s:hi("SpecialKey", s:polar3_gui, "", s:polar3_term, "", "", "")
call s:hi("SpellBad", s:polar11_gui, s:polar0_gui, s:polar11_term, "NONE", "undercurl", s:polar11_gui)
call s:hi("SpellCap", s:polar13_gui, s:polar0_gui, s:polar13_term, "NONE", "undercurl", s:polar13_gui)
call s:hi("SpellLocal", s:polar5_gui, s:polar0_gui, s:polar5_term, "NONE", "undercurl", s:polar5_gui)
call s:hi("SpellRare", s:polar6_gui, s:polar0_gui, s:polar6_term, "NONE", "undercurl", s:polar6_gui)
call s:hi("Visual", "", s:polar2_gui, "", s:polar1_term, "", "")
call s:hi("VisualNOS", "", s:polar2_gui, "", s:polar1_term, "", "")
"+- Neovim Support -+
call s:hi("healthError", s:polar11_gui, s:polar1_gui, s:polar11_term, s:polar1_term, "", "")
call s:hi("healthSuccess", s:polar14_gui, s:polar1_gui, s:polar14_term, s:polar1_term, "", "")
call s:hi("healthWarning", s:polar13_gui, s:polar1_gui, s:polar13_term, s:polar1_term, "", "")
call s:hi("TermCursorNC", "", s:polar1_gui, "", s:polar1_term, "", "")

"+- Neovim Terminal Colors -+
if has('nvim')
  let g:terminal_color_0 = s:polar1_gui
  let g:terminal_color_1 = s:polar11_gui
  let g:terminal_color_2 = s:polar14_gui
  let g:terminal_color_3 = s:polar13_gui
  let g:terminal_color_4 = s:polar9_gui
  let g:terminal_color_5 = s:polar15_gui
  let g:terminal_color_6 = s:polar8_gui
  let g:terminal_color_7 = s:polar5_gui
  let g:terminal_color_8 = s:polar3_gui
  let g:terminal_color_9 = s:polar11_gui
  let g:terminal_color_10 = s:polar14_gui
  let g:terminal_color_11 = s:polar13_gui
  let g:terminal_color_12 = s:polar9_gui
  let g:terminal_color_13 = s:polar15_gui
  let g:terminal_color_14 = s:polar7_gui
  let g:terminal_color_15 = s:polar6_gui
endif

"+--- Gutter ---+
call s:hi("CursorColumn", "", s:polar1_gui, "NONE", s:polar1_term, "", "")
if g:polar_cursor_line_number_background == 0
  call s:hi("CursorLineNr", s:polar4_gui, s:polar0_gui, "NONE", "", "", "")
else
  call s:hi("CursorLineNr", s:polar4_gui, s:polar1_gui, "NONE", s:polar1_term, "", "")
endif
call s:hi("Folded", s:polar3_gui, s:polar1_gui, s:polar3_term, s:polar1_term, "bold", "")
call s:hi("FoldColumn", s:polar3_gui, s:polar0_gui, s:polar3_term, "NONE", "", "")
call s:hi("SignColumn", s:polar1_gui, s:polar0_gui, s:polar1_term, "NONE", "", "")

"+--- Navigation ---+
call s:hi("Directory", s:polar8_gui, "", s:polar8_term, "NONE", "", "")

"+--- Prompt/Status ---+
call s:hi("EndOfBuffer", s:polar1_gui, "", s:polar1_term, "NONE", "", "")
call s:hi("ErrorMsg", s:polar4_gui, s:polar11_gui, "NONE", s:polar11_term, "", "")
call s:hi("ModeMsg", s:polar4_gui, "", "", "", "", "")
call s:hi("MoreMsg", s:polar4_gui, "", "", "", "", "")
call s:hi("Question", s:polar4_gui, "", "NONE", "", "", "")
if g:polar_uniform_status_lines == 0
  call s:hi("StatusLine", s:polar8_gui, s:polar3_gui, s:polar8_term, s:polar3_term, "NONE", "")
  call s:hi("StatusLineNC", s:polar4_gui, s:polar1_gui, "NONE", s:polar1_term, "NONE", "")
  call s:hi("StatusLineTerm", s:polar8_gui, s:polar3_gui, s:polar8_term, s:polar3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:polar4_gui, s:polar1_gui, "NONE", s:polar1_term, "NONE", "")
else
  call s:hi("StatusLine", s:polar8_gui, s:polar3_gui, s:polar8_term, s:polar3_term, "NONE", "")
  call s:hi("StatusLineNC", s:polar4_gui, s:polar3_gui, "NONE", s:polar3_term, "NONE", "")
  call s:hi("StatusLineTerm", s:polar8_gui, s:polar3_gui, s:polar8_term, s:polar3_term, "NONE", "")
  call s:hi("StatusLineTermNC", s:polar4_gui, s:polar3_gui, "NONE", s:polar3_term, "NONE", "")
endif
call s:hi("WarningMsg", s:polar0_gui, s:polar13_gui, s:polar1_term, s:polar13_term, "", "")
call s:hi("WildMenu", s:polar8_gui, s:polar1_gui, s:polar8_term, s:polar1_term, "", "")

"+--- Search ---+
call s:hi("IncSearch", s:polar1_gui, s:polar8_gui, s:polar1_term, s:polar8_term, s:underline, "")
call s:hi("Search", s:polar1_gui, s:polar8_gui, s:polar1_term, s:polar8_term, "NONE", "")

"+--- Tabs ---+
call s:hi("TabLine", s:polar4_gui, s:polar1_gui, "NONE", s:polar1_term, "NONE", "")
call s:hi("TabLineFill", s:polar4_gui, s:polar1_gui, "NONE", s:polar1_term, "NONE", "")
call s:hi("TabLineSel", s:polar8_gui, s:polar3_gui, s:polar8_term, s:polar3_term, "NONE", "")

"+--- Window ---+
call s:hi("Title", s:polar4_gui, "", "NONE", "", "NONE", "")
call s:hi("VertSplit", s:polar2_gui, s:polar1_gui, s:polar3_term, s:polar1_term, "NONE", "")

"+----------------------+
"+ Language Base Groups +
"+----------------------+
call s:hi("Boolean", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Character", s:polar14_gui, "", s:polar14_term, "", "", "")
call s:hi("Comment", s:polar3_gui_brightened[g:polar_comment_brightness], "", s:polar3_term, "", s:italicize_comments, "")
call s:hi("Conditional", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Constant", s:polar4_gui, "", "NONE", "", "", "")
call s:hi("Define", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Delimiter", s:polar6_gui, "", s:polar6_term, "", "", "")
call s:hi("Exception", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Float", s:polar15_gui, "", s:polar15_term, "", "", "")
call s:hi("Function", s:polar8_gui, "", s:polar8_term, "", "", "")
call s:hi("Identifier", s:polar4_gui, "", "NONE", "", "NONE", "")
call s:hi("Include", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Keyword", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Label", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Number", s:polar15_gui, "", s:polar15_term, "", "", "")
call s:hi("Operator", s:polar9_gui, "", s:polar9_term, "", "NONE", "")
call s:hi("PreProc", s:polar9_gui, "", s:polar9_term, "", "NONE", "")
call s:hi("Repeat", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Special", s:polar4_gui, "", "NONE", "", "", "")
call s:hi("SpecialChar", s:polar13_gui, "", s:polar13_term, "", "", "")
call s:hi("SpecialComment", s:polar8_gui, "", s:polar8_term, "", s:italicize_comments, "")
call s:hi("Statement", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("StorageClass", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("String", s:polar14_gui, "", s:polar14_term, "", "", "")
call s:hi("Structure", s:polar9_gui, "", s:polar9_term, "", "", "")
call s:hi("Tag", s:polar4_gui, "", "", "", "", "")
call s:hi("Todo", s:polar13_gui, "NONE", s:polar13_term, "NONE", "", "")
call s:hi("Type", s:polar9_gui, "", s:polar9_term, "", "NONE", "")
call s:hi("Typedef", s:polar9_gui, "", s:polar9_term, "", "", "")
hi! link Macro Define
hi! link PreCondit PreProc

"+-----------+
"+ Languages +
"+-----------+
call s:hi("awkCharClass", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("awkPatterns", s:polar9_gui, "", s:polar9_term, "", "bold", "")
hi! link awkArrayElement Identifier
hi! link awkBoolLogic Keyword
hi! link awkBrktRegExp SpecialChar
hi! link awkComma Delimiter
hi! link awkExpression Keyword
hi! link awkFieldVars Identifier
hi! link awkLineSkip Keyword
hi! link awkOperator Operator
hi! link awkRegExp SpecialChar
hi! link awkSearch Keyword
hi! link awkSemicolon Delimiter
hi! link awkSpecialCharacter SpecialChar
hi! link awkSpecialPrintf SpecialChar
hi! link awkVariables Identifier

call s:hi("cIncluded", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link cOperator Operator
hi! link cPreCondit PreCondit

hi! link csPreCondit PreCondit
hi! link csType Type
hi! link csXmlTag SpecialComment

call s:hi("cssAttributeSelector", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("cssDefinition", s:polar7_gui, "", s:polar7_term, "", "NONE", "")
call s:hi("cssIdentifier", s:polar7_gui, "", s:polar7_term, "", s:underline, "")
call s:hi("cssStringQ", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link cssAttr Keyword
hi! link cssBraces Delimiter
hi! link cssClassName cssDefinition
hi! link cssColor Number
hi! link cssProp cssDefinition
hi! link cssPseudoClass cssDefinition
hi! link cssPseudoClassId cssPseudoClass
hi! link cssVendor Keyword

call s:hi("dosiniHeader", s:polar8_gui, "", s:polar8_term, "", "", "")
hi! link dosiniLabel Type

call s:hi("dtBooleanKey", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("dtExecKey", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("dtLocaleKey", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("dtNumericKey", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("dtTypeKey", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link dtDelim Delimiter
hi! link dtLocaleValue Keyword
hi! link dtTypeValue Keyword

if g:polar_uniform_diff_background == 0
  call s:hi("DiffAdd", s:polar14_gui, s:polar0_gui, s:polar14_term, "NONE", "inverse", "")
  call s:hi("DiffChange", s:polar13_gui, s:polar0_gui, s:polar13_term, "NONE", "inverse", "")
  call s:hi("DiffDelete", s:polar11_gui, s:polar0_gui, s:polar11_term, "NONE", "inverse", "")
  call s:hi("DiffText", s:polar9_gui, s:polar0_gui, s:polar9_term, "NONE", "inverse", "")
else
  call s:hi("DiffAdd", s:polar14_gui, s:polar1_gui, s:polar14_term, s:polar1_term, "", "")
  call s:hi("DiffChange", s:polar13_gui, s:polar1_gui, s:polar13_term, s:polar1_term, "", "")
  call s:hi("DiffDelete", s:polar11_gui, s:polar1_gui, s:polar11_term, s:polar1_term, "", "")
  call s:hi("DiffText", s:polar9_gui, s:polar1_gui, s:polar9_term, s:polar1_term, "", "")
endif
" Legacy groups for official git.vim and diff.vim syntax
hi! link diffAdded DiffAdd
hi! link diffChanged DiffChange
hi! link diffRemoved DiffDelete

call s:hi("gitconfigVariable", s:polar7_gui, "", s:polar7_term, "", "", "")

call s:hi("goBuiltins", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link goConstants Keyword

call s:hi("helpBar", s:polar3_gui, "", s:polar3_term, "", "", "")
call s:hi("helpHyperTextJump", s:polar8_gui, "", s:polar8_term, "", s:underline, "")

call s:hi("htmlArg", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("htmlLink", s:polar4_gui, "", "", "", "NONE", "NONE")
hi! link htmlBold Bold
hi! link htmlEndTag htmlTag
hi! link htmlItalic Italic
hi! link htmlH1 markdownH1
hi! link htmlH2 markdownH1
hi! link htmlH3 markdownH1
hi! link htmlH4 markdownH1
hi! link htmlH5 markdownH1
hi! link htmlH6 markdownH1
hi! link htmlSpecialChar SpecialChar
hi! link htmlTag Keyword
hi! link htmlTagN htmlTag

call s:hi("javaDocTags", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link javaCommentTitle Comment
hi! link javaScriptBraces Delimiter
hi! link javaScriptIdentifier Keyword
hi! link javaScriptNumber Number

call s:hi("jsonKeyword", s:polar7_gui, "", s:polar7_term, "", "", "")

call s:hi("lessClass", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link lessAmpersand Keyword
hi! link lessCssAttribute Delimiter
hi! link lessFunction Function
hi! link cssSelectorOp Keyword

hi! link lispAtomBarSymbol SpecialChar
hi! link lispAtomList SpecialChar
hi! link lispAtomMark Keyword
hi! link lispBarSymbol SpecialChar
hi! link lispFunc Function

hi! link luaFunc Function

call s:hi("markdownBlockquote", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("markdownCode", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("markdownCodeDelimiter", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("markdownFootnote", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("markdownId", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("markdownIdDeclaration", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("markdownH1", s:polar8_gui, "", s:polar8_term, "", "", "")
call s:hi("markdownLinkText", s:polar8_gui, "", s:polar8_term, "", "", "")
call s:hi("markdownUrl", s:polar4_gui, "", "NONE", "", "NONE", "")
hi! link markdownBold Bold
hi! link markdownBoldDelimiter Keyword
hi! link markdownFootnoteDefinition markdownFootnote
hi! link markdownH2 markdownH1
hi! link markdownH3 markdownH1
hi! link markdownH4 markdownH1
hi! link markdownH5 markdownH1
hi! link markdownH6 markdownH1
hi! link markdownIdDelimiter Keyword
hi! link markdownItalic Italic
hi! link markdownItalicDelimiter Keyword
hi! link markdownLinkDelimiter Keyword
hi! link markdownLinkTextDelimiter Keyword
hi! link markdownListMarker Keyword
hi! link markdownRule Keyword
hi! link markdownHeadingDelimiter Keyword

call s:hi("perlPackageDecl", s:polar7_gui, "", s:polar7_term, "", "", "")

call s:hi("phpClasses", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("phpDocTags", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link phpDocCustomTags phpDocTags
hi! link phpMemberSelector Keyword

call s:hi("podCmdText", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("podVerbatimLine", s:polar4_gui, "", "NONE", "", "", "")
hi! link podFormat Keyword

hi! link pythonBuiltin Type
hi! link pythonEscape SpecialChar

call s:hi("rubyConstant", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("rubySymbol", s:polar6_gui, "", s:polar6_term, "", "bold", "")
hi! link rubyAttribute Identifier
hi! link rubyBlockParameterList Operator
hi! link rubyInterpolationDelimiter Keyword
hi! link rubyKeywordAsMethod Function
hi! link rubyLocalVariableOrMethod Function
hi! link rubyPseudoVariable Keyword
hi! link rubyRegexp SpecialChar

call s:hi("sassClass", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("sassId", s:polar7_gui, "", s:polar7_term, "", s:underline, "")
hi! link sassAmpersand Keyword
hi! link sassClassChar Delimiter
hi! link sassControl Keyword
hi! link sassControlLine Keyword
hi! link sassExtend Keyword
hi! link sassFor Keyword
hi! link sassFunctionDecl Keyword
hi! link sassFunctionName Function
hi! link sassidChar sassId
hi! link sassInclude SpecialChar
hi! link sassMixinName Function
hi! link sassMixing SpecialChar
hi! link sassReturn Keyword

hi! link shCmdParenRegion Delimiter
hi! link shCmdSubRegion Delimiter
hi! link shDerefSimple Identifier
hi! link shDerefVar Identifier

hi! link sqlKeyword Keyword
hi! link sqlSpecial Keyword

call s:hi("vimAugroup", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("vimMapRhs", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("vimNotation", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link vimFunc Function
hi! link vimFunction Function
hi! link vimUserFunc Function

call s:hi("xmlAttrib", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("xmlCdataStart", s:polar3_gui, "", s:polar3_term, "", "bold", "")
call s:hi("xmlNamespace", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link xmlAttribPunct Delimiter
hi! link xmlCdata Comment
hi! link xmlCdataCdata xmlCdataStart
hi! link xmlCdataEnd xmlCdataStart
hi! link xmlEndTag xmlTagName
hi! link xmlProcessingDelim Keyword
hi! link xmlTagName Keyword

call s:hi("yamlBlockMappingKey", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link yamlBool Keyword
hi! link yamlDocumentStart Keyword

"+----------------+
"+ Plugin Support +
"+----------------+
"+--- UI ---+
" ALE
" > w0rp/ale
call s:hi("ALEWarningSign", s:polar13_gui, "", s:polar13_term, "", "", "")
call s:hi("ALEErrorSign" , s:polar11_gui, "", s:polar11_term, "", "", "")

" GitGutter
" > airblade/vim-gitgutter
call s:hi("GitGutterAdd", s:polar14_gui, "", s:polar14_term, "", "", "")
call s:hi("GitGutterChange", s:polar13_gui, "", s:polar13_term, "", "", "")
call s:hi("GitGutterChangeDelete", s:polar11_gui, "", s:polar11_term, "", "", "")
call s:hi("GitGutterDelete", s:polar11_gui, "", s:polar11_term, "", "", "")

" Signify
" > mhinz/vim-signify
call s:hi("SignifySignAdd", s:polar14_gui, "", s:polar14_term, "", "", "")
call s:hi("SignifySignChange", s:polar13_gui, "", s:polar13_term, "", "", "")
call s:hi("SignifySignChangeDelete", s:polar11_gui, "", s:polar11_term, "", "", "")
call s:hi("SignifySignDelete", s:polar11_gui, "", s:polar11_term, "", "", "")

" fugitive.vim
" > tpope/vim-fugitive
call s:hi("gitcommitDiscardedFile", s:polar11_gui, "", s:polar11_term, "", "", "")
call s:hi("gitcommitUntrackedFile", s:polar11_gui, "", s:polar11_term, "", "", "")
call s:hi("gitcommitSelectedFile", s:polar14_gui, "", s:polar14_term, "", "", "")

" davidhalter/jedi-vim
call s:hi("jediFunction", s:polar4_gui, s:polar3_gui, "", s:polar3_term, "", "")
call s:hi("jediFat", s:polar8_gui, s:polar3_gui, s:polar8_term, s:polar3_term, s:underline."bold", "")

" NERDTree
" > scrooloose/nerdtree
call s:hi("NERDTreeExecFile", s:polar7_gui, "", s:polar7_term, "", "", "")
hi! link NERDTreeDirSlash Keyword
hi! link NERDTreeHelp Comment

" CtrlP
" > ctrlpvim/ctrlp.vim
hi! link CtrlPMatch Keyword
hi! link CtrlPBufferHid Normal

" vim-plug
" > junegunn/vim-plug
call s:hi("plugDeleted", s:polar11_gui, "", "", s:polar11_term, "", "")

" vim-signature
" > kshenoy/vim-signature
call s:hi("SignatureMarkText", s:polar8_gui, "", s:polar8_term, "", "", "")

"+--- Languages ---+
" JavaScript
" > pangloss/vim-javascript
call s:hi("jsGlobalNodeObjects", s:polar8_gui, "", s:polar8_term, "", s:italic, "")
hi! link jsBrackets Delimiter
hi! link jsFuncCall Function
hi! link jsFuncParens Delimiter
hi! link jsThis Keyword
hi! link jsNoise Delimiter
hi! link jsPrototype Keyword
hi! link jsRegexpString SpecialChar

" Markdown
" > plasticboy/vim-markdown
call s:hi("mkdCode", s:polar7_gui, "", s:polar7_term, "", "", "")
call s:hi("mkdFootnote", s:polar8_gui, "", s:polar8_term, "", "", "")
call s:hi("mkdRule", s:polar10_gui, "", s:polar10_term, "", "", "")
call s:hi("mkdLineBreak", s:polar9_gui, "", s:polar9_term, "", "", "")
hi! link mkdBold Bold
hi! link mkdItalic Italic
hi! link mkdString Keyword
hi! link mkdCodeStart mkdCode
hi! link mkdCodeEnd mkdCode
hi! link mkdBlockquote Comment
hi! link mkdListItem Keyword
hi! link mkdListItemLine Normal
hi! link mkdFootnotes mkdFootnote
hi! link mkdLink markdownLinkText
hi! link mkdURL markdownUrl
hi! link mkdInlineURL mkdURL
hi! link mkdID Identifier
hi! link mkdLinkDef mkdLink
hi! link mkdLinkDefTarget mkdURL
hi! link mkdLinkTitle mkdInlineURL
hi! link mkdDelimiter Keyword

" Vimwiki
" > vimwiki/vimwiki
if !exists("g:vimwiki_hl_headers") || g:vimwiki_hl_headers == 0
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:polar8_gui, "", s:polar8_term, "", "bold", "")
  endfor
else
  let s:vimwiki_hcolor_guifg = [s:polar7_gui, s:polar8_gui, s:polar9_gui, s:polar10_gui, s:polar14_gui, s:polar15_gui]
  let s:vimwiki_hcolor_ctermfg = [s:polar7_term, s:polar8_term, s:polar9_term, s:polar10_term, s:polar14_term, s:polar15_term]
  for s:i in range(1,6)
    call s:hi("VimwikiHeader".s:i, s:vimwiki_hcolor_guifg[s:i-1] , "", s:vimwiki_hcolor_ctermfg[s:i-1], "", "bold", "")
  endfor
endif

call s:hi("VimwikiLink", s:polar8_gui, "", s:polar8_term, "", s:underline, "")
hi! link VimwikiHeaderChar markdownHeadingDelimiter
hi! link VimwikiHR Keyword
hi! link VimwikiList markdownListMarker

" YAML
" > stephpy/vim-yaml
call s:hi("yamlKey", s:polar7_gui, "", s:polar7_term, "", "", "")
