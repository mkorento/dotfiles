set nocompatible
set encoding=utf-8
set completeopt=longest,menuone
set complete+=k
set number
set laststatus=2
set wildmode=list:full
set wildmenu
set undofile
set undodir=~/.vim/undodir
set backupdir=~/.vim/backup
set dir=~/.vim/swap
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set list
set nowrap
set shortmess=a
set pastetoggle=<F11>
set omnifunc=syntaxcomplete#Complete
set expandtab
set tabstop=4
set shiftwidth=4
set showcmd
set showmatch
set cryptmethod=blowfish2
set modifiable
set clipboard=unnamedplus " Use system clipboard.
set backspace=0
set hidden
set viminfo^=%,'100,h
set ttimeoutlen=10
set modeline
set nojoinspaces
set wildignore+=venv/*,**/venv/**,*.pyc
set textwidth=80
set ruler
set t_Co=256
set so=999
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

runtime bundle/vim-pathogen/autoload/pathogen.vim
silent! execute pathogen#infect()

syntax on
syntax enable
filetype plugin indent on

" MAPPINGS
" change leader key
map <space> <leader>

" toggle highlighting off like like Less
map <silent><C-[>u :nohl<CR>

map <F2> :bprevious<CR>
map <F3> :bnext<CR>

" :w shortcut
imap <C-e> <esc>:w<CR>
cmap <C-e> <esc>:w<CR>
map <C-e> <esc>:w<CR>

" :q shortcut, confirm when quitting
imap <C-a> <esc>:CQuit<CR>
cmap <C-a> <esc>:CQuit<CR>
map <C-a> <esc>:CQuit<CR>

" remove (annoying) aligning during insert mode
imap <C-d> <NOP>
imap <C-t> <NOP>
imap <C-i> <NOP>

" more common-sensical movement with j and k
nnoremap j gj
nnoremap k gk

" restore increment and decrement 
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>

" create numbered list of the selected lines
vnoremap <leader>d :call NumList()<CR>

" blink higlighting when searching
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>

" move easily between windows
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" remap backspace to moving into left window (because of reasons (xbindkeys))
nnoremap <BS> <C-w>h

" repeat last macro
nnoremap Q @@

" no need for arrow keys
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>

" quickly overwrite read-only files
cnoremap w!! w !sudo /usr/bin/tee % >/dev/null

" for quick moving
map s <Plug>(easymotion-W)
map H <Plug>(easymotion-B)

" start plugins
imap <Tab> <Plug>snipMateNextOrTrigger
nmap Z <Plug>VinegarUp

onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

" undotree
nnoremap <F5> :UndotreeToggle<CR>

let $VIMHOME = $HOME."/.vim"
let g:CSApprox_verbose_level = 0
let g:EasyMotion_leader_key = '<nop>'
let g:EasyMotion_keys = 'uhetonasidbkmjxgycpfrlvz'
let g:EasyMotion_verbose = 0
let g:netrw_liststyle=0
let g:netrw_preview=1
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let NERDTreeShowLineNumbers=1
let NERDTreeHighlightCursorline=1
let NERDTreeHijackNetrw=0
let g:netrw_browsex_viewer=$VIMHOME."/bin/vim-browser"
let g:netrw_dirhistmax = 0

" Use whole "words" when opening URLs.
" This avoids cutting off parameters (after '?') and anchors (after '#').
" See http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"
let g:syntastic_haskell_checkers = ['scan', 'hlint']
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_c_checkers = ['gcc', 'make']
let g:syntastic_python_checkers = ['flake8', 'pep257', 'pep8', 'pyflakes',
                                  \'pylama', 'pylint', 'python']

let g:niji_matching_filetypes = ['lisp', 'scheme', 'racket', 'clojure',
                                \'sh', 'bash', 'zsh',
                                \'conf']
let g:niji_light_colours = [[248,  'NONE'], [37,  'NONE'], [207, 'NONE'], [124,  'NONE'],
                            \[34, 'NONE'], [127, 'NONE'], [203,  'NONE'], [63,  'NONE']]
let g:niji_dark_colours = g:niji_light_colours

if has("autocmd")
    autocmd FileType mail,gitcommit,gitsendemail setlocal textwidth=72
    autocmd FileType gitcommit highlight Keyword ctermfg=darkgreen ctermbg=none
    autocmd BufEnter,WinEnter * 2mat ErrorMsg '\%81v.'
    autocmd WinEnter * :set winfixheight
    autocmd WinEnter * :wincmd =
    autocmd BufNewFile,BufReadPost *.md,*.markdown,*.mdown,*.mkd,*.mkdn
    \ set filetype=markdown
    autocmd BufRead,BufNewFile *mutt-*
                \ setfiletype mail set spell spelllang=fi,en
    autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

    "disable processing .ass files because it slows vim down to a crawl
    autocmd! bufreadpost *.ass set syntax=off

    augroup NoSimultaneousEdits
        autocmd!
        autocmd SwapExists * let v:swapchoice = 'o'
        autocmd SwapExists * echohl ErrorMsg
        autocmd SwapExists * echo 'Duplicate edit session (readonly)'
        autocmd SwapExists * echohl None
        autocmd SwapExists * sleep 1
    augroup END

    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=1000
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

function! ConfirmQuit()
    let l:confirmed = confirm("Do you really want to quit?", "&Yes\n&No", 1)
    if l:confirmed == 1
        qall!
    endif
endf
command CQuit :silent call ConfirmQuit()

function! GenerateReference()
    let chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    let ref=''

    for i in [1,2]
        let o=system("echo $(($RANDOM%62))")

        let ref=ref . chars[o]
    endfor

    exe "normal a_".ref."\<Esc>"
endf
command Ref call GenerateReference()

function! FixQuotation()
    mark r
    silent! %s/‘/'/gei
    silent! %s/’/'/gei
    silent! %s/“/"/gei
    silent! %s/”/"/gei
    silent! %s/’/'/gei
    silent! %s/،/,/gei
    silent! %s/、/,/gei
    silent! %s/‒/-/gei
    silent! %s/–/-/gei
    silent! %s/—/-/gei
    silent! %s/―/-/gei
    silent! %s/-/-/gei
    silent! %s/­/-/gei
    silent! %s/⁄/\//gei
    silent! %s/〃/,,/gei
    silent! %s/′/'/gei
    silent! %s/″/''/gei
    silent! %s/‴/"'/gei
    silent! %s/…/.../gei
    'r
endf
command FixQuotation call FixQuotation()

function! ClearRegisters()
    let regs='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-="*+'
    let i=0
    while (i<strlen(regs))
        exec 'let @'.regs[i].'=""'
        let i=i+1
    endwhile
endfunction

command! ClearRegisters call ClearRegisters()

function! HLNext (blinktime)
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('Exception', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 400) . 'm'
    call matchdelete(ring)
    redraw
endfunction

function! s:NextTextObject(motion, dir)
    let c = nr2char(getchar())

    if c ==# "b"
        let c = "("
    elseif c ==# "B"
        let c = "{"
    elseif c ==# "d"
        let c = "["
    endif

    exe "normal! ".a:dir.c."v".a:motion.c
endfunction

function! NumList()
  let n = line("'>") - line("'<") + 1
  let i = line('.') - line("'<") + 1
  let pad = repeat(" ",(len(n)-len(i)))
  exe "normal 0i".pad.i.". \<Esc>0"
endf

fun! TodoStage()
    .!cp /home/mika/luettavaa/todo /home/mika/luettavaa/todo_staged

    exec "quitall!"
endf
command! TodoStage call TodoStage()

fun! CleanSubFile()
    silent! normal gg
    silent! g/^ $/d

    silent! normal gg
    silent! normal d}

    while line(".") < line("$")
        silent! normal d}
        silent! normal }
    endwhile

    silent! normal gg
    silent! g/-->.*align:start/d

    silent! g/^$/d

    silent! normal gg
    silent! normal gq}
    silent! normal gg

endf

command! CleanSubFile call CleanSubFile()

" todo: does not work on unicode
function! BreakLongLine()
    let line=getline('.')

    if strlen(line) < 1
        return
    endif

    " strip leading/trailing whitespace, add trailing quotes
    let long_line = '"' . substitute(line, '^\s*\(.\{-}\)\s*$', '\1', '') . '"'

    let i=0
    let last_whitespace=0
    let paragraph=[]

    while 1
        if strlen(long_line) < 80
            call add(paragraph, long_line)
            break
        else
            while i < 80
                if long_line[i] == ' '
                    let last_whitespace=i
                endif
                let i += 1
            endw

            if long_line[80] != ' '
                let next_row = long_line[0:last_whitespace-1]

                call add(paragraph, next_row)
                let long_line = ' ' . long_line[last_whitespace+1:]
            else
                let next_row = long_line[0:79]

                call add(paragraph, next_row)
                let long_line = ' ' . long_line[81:]
            endif

            let i = 0

        endif
    endw

    if line('.') == line('$')
        exec ':normal S'
    else
        delete
    endif

    for line in reverse(paragraph)
        exec ':normal O' . line
    endfor

    exec ':normal 0'

endfunction

" quote, break and indent a long line nicely
noremap <leader>; :call BreakLongLine()<CR>

" for notification purposes
function! Flash()
    highlight CursorLine ctermfg=white ctermbg=darkred
    highlight CursorColumn ctermfg=white ctermbg=darkred
    execute 'match CursorColumn /\%#/'
    execute 'match CursorLine /\%#/'

    set cursorline
    set cursorcolumn
    redraw

    execute "sleep 1000m"

    match none
    set nocursorcolumn
    set nocursorline
endfunction

function! AESTHETIC()
    exe "normal 0"

    let abc=getline('.')
    let i=0
    let length=strchars(abc)-1
    while i < length
        let i+=1
        exe "normal a \<Esc>l"
    endw

    exe "normal 0"
    exe "normal gUU"
endfunction

command! AESTHETIC call AESTHETIC()

function! IsoPieni()
    exe "normal 0"

    let abc=getline('.')
    let i=0
    let length=strchars(abc)-1
    while i < length
        let i+=1
        exe "normal l"
        exe "normal gUl"
        exe "normal l"
    endw

endfunction

command! IsoPieni call IsoPieni()

if &term == 'linux'
    colorscheme system16
else
    colorscheme bw_dark
endif

" syntax for default ft=
highlight Mikan cterm=italic ctermfg=1 ctermbg=NONE
syntax region Mikan start="_" end="_" oneline
syntax match Mikan /^_.*$/

