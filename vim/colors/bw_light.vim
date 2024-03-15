let s:cpo_save = &cpo
set cpo&vim
hi clear

if exists('syntax_on')
    syntax reset
endif
let colors_name = 'bw_light'

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
            \ "gray": "8",
            \ "darkgray": "7",
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
call s:highlight( 'Search'      , 'none'   , 'white'    , 'darkgray'   )
call s:highlight( 'Todo'        , 'none'   , 'gray'     , 'darkgray'   )
call s:highlight( 'Comment'     , 'none'   , 'darkgray' , 'none'       )
call s:highlight( 'VertSplit'   , 'none'   , 'gray'     , 'darkgray'   )
call s:highlight( 'Cursor'      , 'none'   , 'gray'     , 'none'       )
call s:highlight( 'CursorColumn', 'none'   , 'none'     , 'none'       )
call s:highlight( 'CursorLine'  , 'none'   , 'none'     , 'none'       )
call s:highlight( 'DiffAdd'     , 'none'   , 'black'    , 'green'      )
call s:highlight( 'DiffChange'  , 'none'   , 'none'     , 'none'       )
call s:highlight( 'DiffDelete'  , 'none'   , 'none'     , 'red'        )
call s:highlight( 'DiffText'    , 'bold'   , 'darkyellow', 'black'     )
call s:highlight( 'Directory'   , 'none'   , 'cyan'     , 'none'       )
call s:highlight( 'ErrorMsg'    , 'none'   , 'gray'     , 'darkgray'   )
call s:highlight( 'FoldColumn'  , 'none'   , 'darkgray' , 'none'       )
call s:highlight( 'Folded'      , 'none'   , 'black'    , 'darkgray'   )
call s:highlight( 'IncSearch'   , 'none'   , 'white'    , 'gray'       )

call s:highlight( 'LineNr'      , 'none'   , 'darkblue'   , 'none'        )
call s:highlight( 'CursorLineNr', 'bold'   , 'darkgreen'  , 'none'        )
call s:highlight( 'MatchParen'  , 'bold'   , 'red'        , 'none'        )
call s:highlight( 'MoreMsg'     , 'bold'   , 'green'      , 'none'        )
call s:highlight( 'NonText'     , 'none'   , 'blue'       , 'none'        )
call s:highlight( 'Pmenu'       , 'none'   , 'black'      , 'darkgray'    )
call s:highlight( 'PmenuSel'    , 'none'   , 'white'      , 'violet'      )
call s:highlight( 'PmenuSbar'   , 'none'   , 'none'       , 'darkblue'    )
call s:highlight( 'PmenuThumb'  , 'none'   , 'none'       , 'background'  )
call s:highlight( 'Question'    , 'none'   , 'green'      , 'none'        )
call s:highlight( 'SignColumn'  , 'none'   , 'darkblue'   , 'none'        )
call s:highlight( 'SpecialKey'  , 'none'   , 'blue'       , 'none'        )
call s:highlight( 'StatusLine'  , 'none'   , 'white'      , 'darkgray'    )
call s:highlight( 'StatusLineNC', 'none'   , 'white'      , 'white'       )
call s:highlight( 'TabLineFill' , 'none'   , 'darkblue'   , 'darkblue'    )
call s:highlight( 'TabLine'     , 'none'   , 'darkblue'   , 'darkblue'    )
call s:highlight( 'TabLineSel'  , 'bold'   , 'none'       , 'none'        )
call s:highlight( 'Title'       , 'none'   , 'magenta'    , 'none'        )

call s:highlight( 'Visual'      , 'none'   , 'white'    , 'darkgray'   )
call s:highlight( 'VisualNOS'   , 'none'   , 'none'     , 'darkgray'   )
call s:highlight( 'WarningMsg'  , 'bold'   , 'gray'     , 'none'       )

call s:highlight( 'WildMenu'    , 'none'   , 'white'      , 'gray'        )
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

call s:highlight( 'htmlBold',                'none', 'gray',    'none')
call s:highlight( 'htmlItalic',              'none', 'gray',    'none')
call s:highlight( 'htmlUnderline',           'none', 'gray',    'none')
call s:highlight( 'htmlBoldItalic',          'bold', 'gray',    'none')
call s:highlight( 'htmlBoldUnderline',       'bold', 'gray',    'none')
call s:highlight( 'htmlUnderlineItalic',     'none', 'gray',    'none')
call s:highlight( 'htmlBoldUnderlineItalic', 'bold', 'gray',    'none')

highlight Merkkijono cterm=NONE ctermfg=7 ctermbg=NONE
syntax region Merkkijono start='"' end='"'

set background=dark

let &cpo = s:cpo_save
unlet! s:cpo_save s:rgb_map
delfunction s:highlight
