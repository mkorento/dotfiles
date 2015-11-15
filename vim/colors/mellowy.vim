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
            \ "black": "Black",
            \ "darkblue": "DarkBlue",
            \ "darkred": "DarkRed",
            \ "darkyellow": "DarkYellow",
            \ "darkgreen": "DarkGreen",
            \ "gray": "Gray",
            \ "red": "Red",
            \ "green": "Green",
            \ "yellow": "Yellow",
            \ "blue": "Blue",
            \ "magenta": "Magenta",
            \ "violet": "DarkMagenta",
            \ "cyan": "Cyan",
            \ "fixme": "51" }

call s:highlight( 'Normal'      , 'none'   , 'black'       , 'background' )
call s:highlight( 'PreProc'     , 'none'   , 'darkyellow'  , 'none'       )
call s:highlight( 'Keyword'     , 'none'   , 'darkgreen'   , 'none'       )
call s:highlight( 'Number'      , 'none'   , 'blue'        , 'none'       )
call s:highlight( 'String'      , 'none'   , 'magenta'     , 'none'       )
call s:highlight( 'Function'    , 'none'   , 'darkgreen'   , 'none'       )
call s:highlight( 'Special'     , 'none'   , 'magenta'     , 'none'       )
call s:highlight( 'Statement'   , 'none'   , 'darkyellow'  , 'none'       )
call s:highlight( 'Type'        , 'none'   , 'blue'        , 'none'       )
call s:highlight( 'Constant'    , 'none'   , 'black'       , 'none'       )
call s:highlight( 'Identifier'  , 'none'   , 'cyan'        , 'none'       )
call s:highlight( 'Search'      , 'none'   , 'black'       , 'gray'       )
call s:highlight( 'Todo'        , 'none'   , 'black'       , 'yellow'     )
call s:highlight( 'Comment'     , 'none'   , 'gray'        , 'none'       )
call s:highlight( 'VertSplit'   , 'none'   , 'darkblue'    , 'gray'       )
call s:highlight( 'Cursor'      , 'none'   , 'blue'        , 'none'       )
call s:highlight( 'CursorColumn', 'none'   , 'none'        , 'darkblue'   )
call s:highlight( 'CursorLine'  , 'none'   , 'none'        , 'none'       )
call s:highlight( 'DiffAdd'     , 'none'   , 'darkgreen'   , 'green'      )
call s:highlight( 'DiffChange'  , 'none'   , 'none'        , 'gray'       )
call s:highlight( 'DiffDelete'  , 'none'   , 'background'  , 'red'        )
call s:highlight( 'DiffText'    , 'bold'   , 'background'  , 'darkblue'   )
call s:highlight( 'Directory'   , 'none'   , 'cyan'        , 'none'       )
call s:highlight( 'ErrorMsg'    , 'none'   , 'background'  , 'darkred'    )
call s:highlight( 'FoldColumn'  , 'none'   , 'fixme'       , 'fixme'      )
call s:highlight( 'Folded'      , 'none'   , 'background'  , 'blue'       )
call s:highlight( 'IncSearch'   , 'none'   , 'background'  , 'blue'       )

call s:highlight( 'LineNr'      , 'none'   , 'darkblue'   , 'none'        )
call s:highlight( 'CursorLineNr', 'bold'   , 'darkgreen'  , 'none'        )
call s:highlight( 'MatchParen'  , 'bold'   , 'red'        , 'gray'        )
call s:highlight( 'MoreMsg'     , 'bold'   , 'green'      , 'none'        )
call s:highlight( 'NonText'     , 'none'   , 'blue'       , 'none'        )
call s:highlight( 'Pmenu'       , 'none'   , 'black'      , 'gray'        )
call s:highlight( 'PmenuSel'    , 'none'   , 'gray'       , 'violet'      )
call s:highlight( 'PmenuSbar'   , 'none'   , 'none'       , 'darkblue'    )
call s:highlight( 'PmenuThumb'  , 'none'   , 'none'       , 'background'  )
call s:highlight( 'Question'    , 'none'   , 'green'      , 'none'        )
call s:highlight( 'SignColumn'  , 'none'   , 'black'      , 'background'  )
call s:highlight( 'SpecialKey'  , 'none'   , 'blue'       , 'none'        )
call s:highlight( 'StatusLine'  , 'none'   , 'darkyellow' , 'background'  )
call s:highlight( 'StatusLineNC', 'reverse', 'none'       , 'none'        )
call s:highlight( 'TabLineFill' , 'none'   , 'black'      , 'darkblue'    )
call s:highlight( 'TabLine'     , 'none'   , 'black'      , 'darkblue'    )
call s:highlight( 'TabLineSel'  , 'bold'   , 'none'       , 'none'        )
call s:highlight( 'Title'       , 'none'   , 'magenta'    , 'none'        )

call s:highlight( 'Visual'      , 'none'   , 'background' , 'violet'      )
call s:highlight( 'VisualNOS'   , 'none'   , 'none'       , 'darkblue'    )
call s:highlight( 'WarningMsg'  , 'bold'   , 'red'        , 'none'        )

call s:highlight( 'WildMenu'    , 'none'   , 'background' , 'violet'      )
call s:highlight( 'Error'       , 'none'   , 'background' , 'red'         )
call s:highlight( 'Ignore'      , 'none'   , 'darkblue'   , 'none'        )
call s:highlight( 'Underlined'  , 'none'   , 'black'      , 'none'        )

" gitcommit & diff
call s:highlight( 'gitcommitFile' , 'none' ,  'black'    ,  'none'        )
call s:highlight( 'diffOldFile'   , 'none' ,  'black'    ,  'none'        )
call s:highlight( 'diffIdentical' , 'none' ,  'black'    ,  'none'        )
call s:highlight( 'diffDiffer'    , 'none' ,  'black'    ,  'none'        )
call s:highlight( 'diffBDiffer'   , 'none' ,  'black'    ,  'none'        )
call s:highlight( 'diffIsA'       , 'none' ,  'black'    ,  'none'        )
call s:highlight( 'diffSubname'   , 'none' ,  'blue'     ,  'none'        )
call s:highlight( 'diffOnly'      , 'none' ,  'green'    ,  'none'        )
call s:highlight( 'diffNoEOL'     , 'none' ,  'black'    ,  'darkred'     )
call s:highlight( 'diffNewFile'   , 'none' ,  'red'      ,  'none'        )
call s:highlight( 'diffFile'      , 'none' ,  'green'    ,  'none'        )
call s:highlight( 'diffLine'      , 'none' ,  'blue'     ,  'none'        )
call s:highlight( 'diffComment'   , 'none' ,  'darkblue' ,  'none'        )
call s:highlight( 'diffRemoved'   , 'none' ,  'darkred'  ,  'none'        )
call s:highlight( 'diffAdded'     , 'none' ,  'darkgreen',  'none'        )
call s:highlight( 'diffCommon'    , 'none' ,  'yellow'   ,  'none'        )
call s:highlight( 'diffChanged'   , 'none' ,  'magenta'  ,  'none'        )

call s:highlight( 'SpellBad'    , 'bold'     , 'fixme'   , 'fixme'        )
call s:highlight( 'SpellCap'    , 'bold'     , 'none'    ,  'none'        )
call s:highlight( 'SpellLocal'  , 'underline', 'none'    ,  'none'        )
call s:highlight( 'SpellRare'   , 'underline', 'none'    ,  'none'        )

call s:highlight( 'htmlBold',                'none', 'darkblue',    'none')
call s:highlight( 'htmlItalic',              'none', 'yellow',      'none')
call s:highlight( 'htmlUnderline',           'none', 'black',       'none')
call s:highlight( 'htmlBoldItalic',          'bold', 'yellow',      'none')
call s:highlight( 'htmlBoldUnderline',       'bold', 'magenta',     'none')
call s:highlight( 'htmlUnderlineItalic',     'none', 'magenta',     'none')
call s:highlight( 'htmlBoldUnderlineItalic', 'bold', 'darkblue',    'none')

set background=light

let &cpo = s:cpo_save
unlet! s:cpo_save s:rgb_map
delfunction s:highlight
