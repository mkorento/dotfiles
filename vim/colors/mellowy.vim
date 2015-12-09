" Name:     Solarized vim colorscheme
" Author:   Ethan Schoonover <es@ethanschoonover.com>
" URL:      http://ethanschoonover.com/solarized
"           (see this url for latest release & screenshots)
" License:  OSI approved MIT license (see end of this file)
" Created:  In the middle of the night
" Modified: 2015 Dec 05

let s:cpo_save = &cpo
set cpo&vim
hi clear

if exists('syntax_on')
    syntax reset
endif
let colors_name = 'mellowy'

function s:highlight(groupname, attr, fg, bg)
    exec 'hi' a:groupname 'cterm='.a:attr 'ctermfg='.s:rgb_map[a:fg] 'ctermbg='.s:rgb_map[a:bg]
endfunction

let s:rgb_map = {
            \ "none": "NONE",
            \ "background": "White",
            \ "darkblue": "DarkBlue",
            \ "darkred": "DarkRed",
            \ "darkyellow": "DarkYellow",
            \ "darkgreen": "DarkGreen",
            \ "violet": "DarkMagenta",
            \ "gray": "Gray",
            \ "red": "Red",
            \ "green": "Green",
            \ "yellow": "Yellow",
            \ "blue": "Blue",
            \ "magenta": "Magenta",
            \ "cyan": "Cyan",
            \ "fixme": "51" }

call s:highlight( 'Normal'      , 'none'   , 'darkblue'    , 'background'    )
call s:highlight( 'PreProc'     , 'none'   , 'darkyellow'  , 'none'          )
call s:highlight( 'Keyword'     , 'none'   , 'darkgreen'   , 'none'          )
call s:highlight( 'Number'      , 'none'   , 'blue'        , 'none'          )
call s:highlight( 'String'      , 'none'   , 'magenta'     , 'none'          )
call s:highlight( 'Function'    , 'none'   , 'darkgreen'   , 'none'          )
call s:highlight( 'Special'     , 'none'   , 'cyan'        , 'none'          )
call s:highlight( 'Statement'   , 'none'   , 'darkyellow'  , 'none'          )
call s:highlight( 'Type'        , 'none'   , 'blue'        , 'none'          )
call s:highlight( 'Constant'    , 'none'   , 'darkblue'    , 'none'          )
call s:highlight( 'Identifier'  , 'none'   , 'cyan'        , 'none'          )
call s:highlight( 'Search'      , 'none'   , 'gray'        , 'red'           )
call s:highlight( 'Todo'        , 'none'   , 'darkblue'    , 'yellow'        )
call s:highlight( 'Comment'     , 'none'   , 'gray'        , 'none'          )
call s:highlight( 'VertSplit'   , 'none'   , 'darkblue'    , 'gray'          )
call s:highlight( 'Cursor'      , 'none'   , 'blue'        , 'none'          )
call s:highlight( 'CursorColumn', 'none'   , 'none'        , 'darkblue'      )
call s:highlight( 'CursorLine'  , 'none'   , 'none'        , 'none'          )
call s:highlight( 'DiffAdd'     , 'none'   , 'darkgreen'   , 'green'         )
call s:highlight( 'DiffChange'  , 'none'   , 'none'        , 'gray'          )
call s:highlight( 'DiffDelete'  , 'none'   , 'background'  , 'red'           )
call s:highlight( 'DiffText'    , 'bold'   , 'background'  , 'darkblue'      )
call s:highlight( 'Directory'   , 'none'   , 'cyan'        , 'none'          )
call s:highlight( 'ErrorMsg'    , 'none'   , 'background'  , 'darkred'       )
call s:highlight( 'FoldColumn'  , 'none'   , 'darkblue'    , 'background'    )
call s:highlight( 'Folded'      , 'none'   , 'background'  , 'blue'          )
call s:highlight( 'IncSearch'   , 'none'   , 'background'  , 'blue'          )

call s:highlight( 'LineNr'      , 'none'   , 'darkblue'   , 'none'           )
call s:highlight( 'CursorLineNr', 'bold'   , 'darkgreen'  , 'none'           )
call s:highlight( 'MatchParen'  , 'bold'   , 'red'        , 'gray'           )
call s:highlight( 'MoreMsg'     , 'bold'   , 'green'      , 'none'           )
call s:highlight( 'NonText'     , 'none'   , 'blue'       , 'none'           )
call s:highlight( 'Pmenu'       , 'none'   , 'darkblue'   , 'gray'           )
call s:highlight( 'PmenuSel'    , 'none'   , 'gray'       , 'violet'         )
call s:highlight( 'PmenuSbar'   , 'none'   , 'none'       , 'darkblue'       )
call s:highlight( 'PmenuThumb'  , 'none'   , 'none'       , 'background'     )
call s:highlight( 'Question'    , 'none'   , 'green'      , 'none'           )
call s:highlight( 'SignColumn'  , 'none'   , 'darkblue'   ,    'background'  )
call s:highlight( 'SpecialKey'  , 'none'   , 'blue'       , 'none'           )
call s:highlight( 'StatusLine'  , 'none'   , 'darkyellow' , 'background'     )
call s:highlight( 'StatusLineNC', 'reverse', 'none'       , 'none'           )
call s:highlight( 'TabLineFill' , 'none'   , 'darkblue'   ,    'darkblue'    )
call s:highlight( 'TabLine'     , 'none'   , 'darkblue'   ,    'darkblue'    )
call s:highlight( 'TabLineSel'  , 'bold'   , 'none'       , 'none'           )
call s:highlight( 'Title'       , 'none'   , 'magenta'    , 'none'           )

call s:highlight( 'Visual'      , 'none'   , 'background' , 'violet'         )
call s:highlight( 'VisualNOS'   , 'none'   , 'none'       , 'darkblue'       )
call s:highlight( 'WarningMsg'  , 'bold'   , 'red'        , 'none'           )

call s:highlight( 'WildMenu'    , 'none'   , 'background' , 'violet'         )
call s:highlight( 'Error'       , 'none'   , 'background' , 'red'            )
call s:highlight( 'Ignore'      , 'none'   , 'darkblue'   , 'none'           )
call s:highlight( 'Underlined'  , 'none'   , 'darkblue'   , 'none'           )

" gitcommit & diff
call s:highlight( 'gitcommitFile' , 'none' ,  'darkblue' ,  'none'        )
call s:highlight( 'diffOldFile'   , 'none' ,  'darkblue' ,  'none'        )
call s:highlight( 'diffIdentical' , 'none' ,  'darkblue' ,  'none'        )
call s:highlight( 'diffDiffer'    , 'none' ,  'darkblue' ,  'none'        )
call s:highlight( 'diffBDiffer'   , 'none' ,  'darkblue' ,  'none'        )
call s:highlight( 'diffIsA'       , 'none' ,  'darkblue' ,  'none'        )
call s:highlight( 'diffSubname'   , 'none' ,  'blue'     ,  'none'        )
call s:highlight( 'diffOnly'      , 'none' ,  'green'    ,  'none'        )
call s:highlight( 'diffNoEOL'     , 'none' ,  'darkblue' ,  'darkred'     )
call s:highlight( 'diffNewFile'   , 'none' ,  'red'      ,  'none'        )
call s:highlight( 'diffFile'      , 'none' ,  'green'    ,  'none'        )
call s:highlight( 'diffLine'      , 'none' ,  'blue'     ,  'none'        )
call s:highlight( 'diffComment'   , 'none' ,  'darkblue' ,  'none'        )
call s:highlight( 'diffRemoved'   , 'none' ,  'darkred'  ,  'none'        )
call s:highlight( 'diffAdded'     , 'none' ,  'darkgreen',  'none'        )
call s:highlight( 'diffCommon'    , 'none' ,  'yellow'   ,  'none'        )
call s:highlight( 'diffChanged'   , 'none' ,  'magenta'  ,  'none'        )

call s:highlight( 'SpellBad'    , 'bold'     , 'darkblue',  'fixme'       )
"call s:highlight( 'SpellCap'    , 'bold'     , 'none'    ,  'none'        )
"call s:highlight( 'SpellLocal'  , 'underline', 'none'    ,  'none'        )
"call s:highlight( 'SpellRare'   , 'underline', 'none'    ,  'none'        )

call s:highlight( 'htmlBold',                'none', 'darkblue',    'none')
call s:highlight( 'htmlItalic',              'none', 'yellow',      'none')
call s:highlight( 'htmlUnderline',           'none', 'darkblue',    'none')
call s:highlight( 'htmlBoldItalic',          'bold', 'yellow',      'none')
call s:highlight( 'htmlBoldUnderline',       'bold', 'magenta',     'none')
call s:highlight( 'htmlUnderlineItalic',     'none', 'magenta',     'none')
call s:highlight( 'htmlBoldUnderlineItalic', 'bold', 'darkblue',    'none')

set background=light

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
