let s:cpo_save = &cpo
set cpo&vim
hi clear

if exists('syntax_on')
    syntax reset
endif
let colors_name = 'bw'

function s:highlight(groupname, attr, fg, bg)
    exec 'hi' a:groupname 'cterm='.a:attr 'ctermfg='.s:rgb_map[a:fg] 'ctermbg='.s:rgb_map[a:bg]
endfunction

let s:rgb_map = {
            \ "none": "NONE",
            \ "black": "0",
            \ "darkred": "1",
            \ "darkgreen": "2",
            \ "darkyellow": "3",
            \ "background": "4",
            \ "darkblue": "4",
            \ "violet": "5",
            \ "darkcyan": "6",
            \ "gray": "7",
            \ "darkgray": "8",
            \ "red": "9",
            \ "green": "10",
            \ "yellow": "11",
            \ "blue": "12",
            \ "magenta": "13",
            \ "cyan": "14",
            \ "white": "15",
            \ "fixme": "51" }

call s:highlight( 'Normal'      , 'none'   , 'none'     , 'none'       )
call s:highlight( 'PreProc'     , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Keyword'     , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Number'      , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'String'      , 'none'   , 'darkgray' , 'none'       )
call s:highlight( 'Function'    , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Special'     , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Statement'   , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Type'        , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Constant'    , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Identifier'  , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Search'      , 'none'   , 'gray'     , 'darkgray'   )
call s:highlight( 'Todo'        , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'Comment'     , 'none'   , 'darkgray' , 'none'       )
call s:highlight( 'VertSplit'   , 'none'   , 'gray'     , 'darkgray'   )
call s:highlight( 'Cursor'      , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'CursorColumn', 'none'   , 'none'     , 'none'       )
call s:highlight( 'CursorLine'  , 'none'   , 'none'     , 'none'       )
call s:highlight( 'DiffAdd'     , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'DiffChange'  , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'DiffDelete'  , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'DiffText'    , 'bold'   , 'gray'     , 'gray'       )
call s:highlight( 'Directory'   , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'ErrorMsg'    , 'none'   , 'gray'     , 'darkgray'   )
call s:highlight( 'FoldColumn'  , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Folded'      , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'IncSearch'   , 'none'   , 'gray'     , 'darkgray'   )

call s:highlight( 'LineNr'      , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'CursorLineNr', 'bold'   , 'gray'     , 'none'       )
call s:highlight( 'MatchParen'  , 'bold'   , 'gray'     , 'none'       )
call s:highlight( 'MoreMsg'     , 'bold'   , 'gray'     , 'none'       )
call s:highlight( 'NonText'     , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Pmenu'       , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'PmenuSel'    , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'PmenuSbar'   , 'none'   , 'none'     , 'gray'       )
call s:highlight( 'PmenuThumb'  , 'none'   , 'none'     , 'gray'       )
call s:highlight( 'Question'    , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'SignColumn'  , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'SpecialKey'  , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'StatusLine'  , 'none'   , 'black'    , 'darkgray'   )
call s:highlight( 'StatusLineNC', 'none'   , 'black'    , 'black'      )
call s:highlight( 'TabLineFill' , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'TabLine'     , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'TabLineSel'  , 'bold'   , 'none'     , 'none'       )
call s:highlight( 'Title'       , 'none'   , 'gray'     , 'none'       )

call s:highlight( 'Visual'      , 'none'   , 'gray'     , 'darkgray'   )
call s:highlight( 'VisualNOS'   , 'none'   , 'none'     , 'darkgray'   )
call s:highlight( 'WarningMsg'  , 'bold'   , 'gray'     , 'none'       )

call s:highlight( 'WildMenu'    , 'none'   , 'gray'     , 'gray'       )
call s:highlight( 'Error'       , 'none'   , 'black'    , 'darkgray'   )
call s:highlight( 'Ignore'      , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'Underlined'  , 'none'   , 'gray'     , 'none'       )

" gitcommit & diff
call s:highlight( 'gitcommitFile' , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffOldFile'   , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffIdentical' , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffDiffer'    , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffBDiffer'   , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffIsA'       , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffSubname'   , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffOnly'      , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffNoEOL'     , 'none' ,  'gray' ,  'gray'        )
call s:highlight( 'diffNewFile'   , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffFile'      , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffLine'      , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffComment'   , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffRemoved'   , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffAdded'     , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffCommon'    , 'none' ,  'gray' ,  'none'        )
call s:highlight( 'diffChanged'   , 'none' ,  'gray' ,  'none'        )

call s:highlight( 'SpellBad'    , 'bold'     , 'fixme'   ,  'gray'    )
call s:highlight( 'SpellCap'    , 'bold'     , 'none'    ,  'none'    )
call s:highlight( 'SpellLocal'  , 'underline', 'none'    ,  'none'    )
call s:highlight( 'SpellRare'   , 'underline', 'none'    ,  'none'    )

call s:highlight( 'htmlBold',                'none', 'gray',    'none')
call s:highlight( 'htmlItalic',              'none', 'gray',    'none')
call s:highlight( 'htmlUnderline',           'none', 'gray',    'none')
call s:highlight( 'htmlBoldItalic',          'bold', 'gray',    'none')
call s:highlight( 'htmlBoldUnderline',       'bold', 'gray',    'none')
call s:highlight( 'htmlUnderlineItalic',     'none', 'gray',    'none')
call s:highlight( 'htmlBoldUnderlineItalic', 'bold', 'gray',    'none')

set background=dark

let &cpo = s:cpo_save
unlet! s:cpo_save s:rgb_map
delfunction s:highlight

"}}}
" License "{{{
" ---------------------------------------------------------------------
"
" Copyright (c) 2011 Ethan Schoonover
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"
" vim:foldmethod=marker:foldlevel=0
"}}}
