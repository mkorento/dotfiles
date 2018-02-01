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
let colors_name = 'solarized'

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

call s:highlight( 'Normal'      , 'none'   , 'gray'        , 'none'       )
call s:highlight( 'PreProc'     , 'none'   , 'darkyellow'  , 'none'       )
call s:highlight( 'Keyword'     , 'none'   , 'darkgreen'   , 'none'       )
call s:highlight( 'Number'      , 'none'   , 'blue'        , 'none'       )
call s:highlight( 'String'      , 'none'   , 'magenta'     , 'none'       )
call s:highlight( 'Function'    , 'none'   , 'darkgreen'   , 'none'       )
call s:highlight( 'Special'     , 'none'   , 'cyan'        , 'none'       )
call s:highlight( 'Statement'   , 'none'   , 'yellow'      , 'none'       )
call s:highlight( 'Type'        , 'none'   , 'blue'        , 'none'       )
call s:highlight( 'Constant'    , 'none'   , 'gray'        , 'none'       )
call s:highlight( 'Identifier'  , 'none'   , 'cyan'        , 'none'       )
call s:highlight( 'Search'      , 'none'   , 'white'       , 'blue'       )
call s:highlight( 'Todo'        , 'none'   , 'darkyellow'  , 'black'      )
call s:highlight( 'Comment'     , 'none'   , 'darkblue'    , 'none'       )
call s:highlight( 'VertSplit'   , 'none'   , 'gray'        , 'darkblue'   )
call s:highlight( 'Cursor'      , 'none'   , 'blue'        , 'none'       )
call s:highlight( 'CursorColumn', 'none'   , 'none'        , 'none'       )
call s:highlight( 'CursorLine'  , 'none'   , 'none'        , 'none'       )
call s:highlight( 'DiffAdd'     , 'none'   , 'black'       , 'darkgreen'  )
call s:highlight( 'DiffChange'  , 'none'   , 'none'        , 'none'       )
call s:highlight( 'DiffDelete'  , 'none'   , 'none'        , 'darkred'    )
call s:highlight( 'DiffText'    , 'bold'   , 'darkyellow'  , 'darkgray'   )
call s:highlight( 'Directory'   , 'none'   , 'cyan'        , 'none'       )
call s:highlight( 'ErrorMsg'    , 'none'   , 'white'       , 'darkred'    )
call s:highlight( 'FoldColumn'  , 'none'   , 'gray'        , 'none'       )
call s:highlight( 'Folded'      , 'none'   , 'black'       , 'blue'       )
call s:highlight( 'IncSearch'   , 'none'   , 'white'       , 'darkred'    )

call s:highlight( 'LineNr'      , 'none'   , 'darkblue'   , 'none'        )
call s:highlight( 'CursorLineNr', 'bold'   , 'darkgreen'  , 'none'        )
call s:highlight( 'MatchParen'  , 'bold'   , 'white'      , 'none'        )
call s:highlight( 'MoreMsg'     , 'bold'   , 'green'      , 'none'        )
call s:highlight( 'NonText'     , 'none'   , 'blue'       , 'none'        )
call s:highlight( 'Pmenu'       , 'none'   , 'darkblue'   , 'gray'        )
call s:highlight( 'PmenuSel'    , 'none'   , 'gray'       , 'violet'      )
call s:highlight( 'PmenuSbar'   , 'none'   , 'none'       , 'darkblue'    )
call s:highlight( 'PmenuThumb'  , 'none'   , 'none'       , 'background'  )
call s:highlight( 'Question'    , 'none'   , 'green'      , 'none'        )
call s:highlight( 'SignColumn'  , 'none'   , 'darkblue'   , 'none'        )
call s:highlight( 'SpecialKey'  , 'none'   , 'blue'       , 'none'        )
call s:highlight( 'StatusLine'  , 'none'   , 'black'      , 'darkgray'    )
call s:highlight( 'StatusLineNC', 'none'   , 'black'      , 'black'       )
call s:highlight( 'TabLineFill' , 'none'   , 'darkblue'   , 'darkblue'    )
call s:highlight( 'TabLine'     , 'none'   , 'darkblue'   , 'darkblue'    )
call s:highlight( 'TabLineSel'  , 'bold'   , 'none'       , 'none'        )
call s:highlight( 'Title'       , 'none'   , 'magenta'    , 'none'        )

call s:highlight( 'Visual'      , 'none'   , 'green'      , 'violet'      )
call s:highlight( 'VisualNOS'   , 'none'   , 'none'       , 'darkblue'    )
call s:highlight( 'WarningMsg'  , 'bold'   , 'red'        , 'none'        )

call s:highlight( 'WildMenu'    , 'none'   , 'green'      , 'cyan'        )
call s:highlight( 'Error'       , 'none'   , 'background' , 'red'         )
call s:highlight( 'Ignore'      , 'none'   , 'darkblue'   , 'none'        )
call s:highlight( 'Underlined'  , 'none'   , 'darkblue'   , 'none'        )

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

call s:highlight( 'SpellBad'    , 'bold'     , 'fixme'   ,  'red'         )
call s:highlight( 'SpellCap'    , 'bold'     , 'none'    ,  'none'        )
call s:highlight( 'SpellLocal'  , 'underline', 'none'    ,  'none'        )
call s:highlight( 'SpellRare'   , 'underline', 'none'    ,  'none'        )

call s:highlight( 'htmlBold',                'none', 'darkblue',    'none')
call s:highlight( 'htmlItalic',              'none', 'yellow',      'none')
call s:highlight( 'htmlUnderline',           'none', 'darkblue',    'none')
call s:highlight( 'htmlBoldItalic',          'bold', 'yellow',      'none')
call s:highlight( 'htmlBoldUnderline',       'bold', 'magenta',     'none')
call s:highlight( 'htmlUnderlineItalic',     'none', 'magenta',     'none')
call s:highlight( 'htmlBoldUnderlineItalic', 'bold', 'darkblue',    'none')

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
