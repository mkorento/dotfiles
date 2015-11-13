let s:cpo_save = &cpo
set cpo&vim
hi clear

if exists('syntax_on')
    syntax reset
endif
let colors_name = 'system16'

function s:highlight(groupname, attr, fg, bg)
    if &term == 'linux'
        exec 'hi' a:groupname 'cterm='.a:attr 'ctermfg='.a:fg 'ctermbg='.a:bg
    else
        exec 'hi' a:groupname 'cterm='.a:attr 'ctermfg='.s:rgb_map[a:fg] 'ctermbg='.s:rgb_map[a:bg]
    endif
endfunction

let s:rgb_map = {
  \ "none": "NONE",
  \ "black": "16",
  \ "darkred": "124",
  \ "darkgreen": "34",
  \ "darkyellow": "130",
  \ "darkblue": "19",
  \ "darkmagenta": "127",
  \ "darkcyan": "37",
  \ "grey": "248",
  \ "darkgrey": "240",
  \ "red": "203",
  \ "green": "83",
  \ "yellow": "227",
  \ "blue": "63",
  \ "magenta": "207",
  \ "cyan": "87",
  \ "white": "231",
  \ "mellow": "230" }

call s:highlight( 'Normal'      , 'none'  , 'black'       , 'mellow'     )
call s:highlight( 'PreProc'     , 'none'  , 'darkred'     , 'none'      )
call s:highlight( 'Keyword'     , 'none'  , 'darkgreen'   , 'none'      )
call s:highlight( 'Number'      , 'none'  , 'blue'        , 'none'      )
call s:highlight( 'String'      , 'none'  , 'darkmagenta' , 'none'      )
call s:highlight( 'Function'    , 'none'  , 'darkgreen'   , 'none'      )
call s:highlight( 'Special'     , 'none'  , 'magenta'     , 'none'      )
call s:highlight( 'Statement'   , 'none'  , 'darkred'     , 'none'      )
call s:highlight( 'Type'        , 'none'  , 'blue'        , 'none'      )
call s:highlight( 'Constant'    , 'none'  , 'darkmagenta' , 'none'      )
call s:highlight( 'Identifier'  , 'none'  , 'darkcyan'    , 'none'      )
call s:highlight( 'Search'      , 'none'  , 'black'       , 'darkred'   )
call s:highlight( 'Todo'        , 'none'  , 'black'       , 'yellow'    )
call s:highlight( 'Comment'     , 'none'  , 'darkgrey'    , 'none'      )
call s:highlight( 'VertSplit'   , 'none'  , 'darkgrey'    , 'grey'      )

call s:highlight( 'Cursor'      , 'none'   , 'darkblue'   , 'none'      )
call s:highlight( 'CursorColumn', 'none'   , 'none'       , 'darkgrey'  )
call s:highlight( 'CursorLine'  , 'none'   , 'none'       , 'none'      )
call s:highlight( 'DiffAdd'     , 'none'   , 'darkgreen'  , 'green'     )
call s:highlight( 'DiffChange'  , 'none'   , 'none'       , 'grey'      )
call s:highlight( 'DiffDelete'  , 'none'   , 'white'      , 'red'       )
call s:highlight( 'DiffText'    , 'bold'   , 'yellow'     , 'darkred'   )
call s:highlight( 'Directory'   , 'none'   , 'cyan'       , 'none'      )
call s:highlight( 'ErrorMsg'    , 'none'   , 'white'      , 'darkred'   )
call s:highlight( 'FoldColumn'  , 'none'   , 'yellow'     , 'grey'      )
call s:highlight( 'Folded'      , 'none'   , 'white'      , 'blue'      )
call s:highlight( 'IncSearch'   , 'none'   , 'grey'       , 'darkblue'  )
call s:highlight( 'LineNr'      , 'none'   , 'darkred'    , 'none'      )
call s:highlight( 'CursorLineNr', 'bold'   , 'darkgreen'  , 'none'      )
call s:highlight( 'MatchParen'  , 'bold'   , 'white'      , 'grey'      )
call s:highlight( 'MoreMsg'     , 'bold'   , 'green'      , 'none'      )
call s:highlight( 'NonText'     , 'none'   , 'blue'       , 'none'      )
call s:highlight( 'Pmenu'       , 'none'   , 'black'      , 'grey'      )
call s:highlight( 'PmenuSel'    , 'none'   , 'white'      , 'darkred'   )
call s:highlight( 'PmenuSbar'   , 'none'   , 'none'       , 'darkgrey'  )
call s:highlight( 'PmenuThumb'  , 'none'   , 'none'       , 'white'     )
call s:highlight( 'Question'    , 'none'   , 'green'      , 'none'      )
call s:highlight( 'SignColumn'  , 'none'   , 'darkmagenta', 'mellow'     )
call s:highlight( 'SpecialKey'  , 'none'   , 'blue'       , 'none'      )
call s:highlight( 'StatusLine'  , 'none'   , 'darkred'    , 'mellow'     )
call s:highlight( 'StatusLineNC', 'reverse', 'none'       , 'none'      )
call s:highlight( 'TabLineFill' , 'none'   , 'black'      , 'darkgrey'  )
call s:highlight( 'TabLine'     , 'none'   , 'black'      , 'darkgrey'  )
call s:highlight( 'TabLineSel'  , 'bold'   , 'none'       , 'none'      )
call s:highlight( 'Title'       , 'none'   , 'magenta'    , 'none'      )
call s:highlight( 'Visual'      , 'none'   , 'cyan'       , 'darkblue'  )
call s:highlight( 'VisualNOS'   , 'none'   , 'none'       , 'darkgrey'  )
call s:highlight( 'WarningMsg'  , 'bold'   , 'red'        , 'none'      )
call s:highlight( 'WildMenu'    , 'none'   , 'red'        , 'darkblue'  )
call s:highlight( 'Error'       , 'none'   , 'white'      , 'red'       )
call s:highlight( 'Ignore'      , 'none'   , 'darkgrey'   , 'none'      )
call s:highlight( 'Underlined'  , 'none'   , 'darkmagenta', 'none'      )

" gitcommit & diff
call s:highlight( 'gitcommitFile' , 'none'  , 'black'     , 'none'      )
call s:highlight( 'diffOldFile'   , 'none'  , 'black'     , 'none'      )
call s:highlight( 'diffIdentical' , 'none'  , 'black'     , 'none'      )
call s:highlight( 'diffDiffer'    , 'none'  , 'black'     , 'none'      )
call s:highlight( 'diffBDiffer'   , 'none'  , 'black'     , 'none'      )
call s:highlight( 'diffIsA'       , 'none'  , 'black'     , 'none'      )
call s:highlight( 'diffSubname'   , 'none'  , 'blue'      , 'none'      )
call s:highlight( 'diffOnly'      , 'none'  , 'green'     , 'none'      )
call s:highlight( 'diffNoEOL'     , 'none'  , 'black'     , 'darkred'   )
call s:highlight( 'diffNewFile'   , 'none'  , 'red'       , 'none'      )
call s:highlight( 'diffFile'      , 'none'  , 'green'     , 'none'      )
call s:highlight( 'diffLine'      , 'none'  , 'blue'      , 'none'      )
call s:highlight( 'diffComment'   , 'none'  , 'darkgrey'  , 'none'      )
call s:highlight( 'diffRemoved'   , 'none'  , 'darkred'   , 'none'      )
call s:highlight( 'diffAdded'     , 'none'  , 'darkgreen' , 'none'      )
call s:highlight( 'diffCommon'    , 'none'  , 'darkyellow', 'none'      )
call s:highlight( 'diffChanged'   , 'none'  , 'magenta'   , 'none'      )

call s:highlight( 'SpellBad'    , 'bold'          , 'darkred', 'grey'     )
call s:highlight( 'SpellCap'    , 'bold'          , 'none', 'none'        )
call s:highlight( 'SpellLocal'  , 'underline'     , 'none', 'none'        )
call s:highlight( 'SpellRare'   , 'underline'     , 'none', 'none'        )

call s:highlight( 'htmlBold',                'none', 'darkgrey',    'none')
call s:highlight( 'htmlItalic',              'none', 'yellow',      'none')
call s:highlight( 'htmlUnderline',           'none', 'darkmagenta', 'none')
call s:highlight( 'htmlBoldItalic',          'bold', 'yellow',      'none')
call s:highlight( 'htmlBoldUnderline',       'bold', 'magenta',     'none')
call s:highlight( 'htmlUnderlineItalic',     'none', 'magenta',     'none')
call s:highlight( 'htmlBoldUnderlineItalic', 'bold', 'darkgrey',    'none')

set background=light

let &cpo = s:cpo_save
unlet! s:cpo_save s:rgb_map
delfunction s:highlight
