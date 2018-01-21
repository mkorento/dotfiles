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
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set showcmd
set showmatch
set cryptmethod=blowfish2
set modifiable
set backspace=0
set hidden
set viminfo^=h
set ttimeoutlen=10
set modeline
set nojoinspaces
set wildignore+=venv/*,**/venv/**,*.pyc
set textwidth=80
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"

runtime bundle/vim-pathogen/autoload/pathogen.vim
silent! execute pathogen#infect()

syntax on
syntax enable
filetype plugin indent on

map <space> <leader>
map <silent><leader>, :noh<CR>
map <silent><leader>= :close<CR>
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
" map <C-e> <esc>:w<CR>
" map <C-a> <esc>:silent CQuit<CR>
map <leader>r <esc>:silent !test -f update_pdf && ./update_pdf<CR><esc>:redraw!<CR>
" imap <C-e> <esc>:w<CR>
" imap <C-a> <esc>:silent CQuit<CR>
" cmap <C-e> <esc>:w<CR>
" cmap <C-a> <esc>:silent CQuit<CR>
map <C-_> <space>
imap <C-_> <space>
cmap <C-_> <space>
imap <C-d> <NOP>
imap <C-t> <NOP>
imap <C-i> <NOP>

nnoremap j gj
nnoremap k gk
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>
nnoremap <leader>2 :tabnext<cr>
nnoremap <leader>1 :tabprevious<cr>
nnoremap <leader><leader> <c-^>
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>
nnoremap <BS> <C-w>h
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap Q @@
nnoremap <silent> <F4> :TlistToggle<CR>
nnoremap <silent> <F5> :GundoToggle<CR>
noremap <Up>    <NOP>
noremap <Down>  <NOP>
noremap <Left>  <NOP>
noremap <Right> <NOP>
inoremap jj <ESC>
inoremap JJ <ESC>
inoremap jk <ESC>
inoremap JK <ESC>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
cnoremap w!! w !sudo /usr/bin/tee % >/dev/null
vnoremap <leader>a :call Incr()<CR>
vnoremap <leader>d :call NumList()<CR>
noremap <leader>; "0I <Esc>gqgqA"<Esc>{jr""

nmap H <Plug>Sneak_S
omap H <Plug>Sneak_S
xmap H <Plug>Sneak_S
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

command! Q q
command! W w
command! Qa qa
command! QA qa
command! Aq qa
command! AQ qa
command! Qa1 qa!
command! QA1 qa!
command! Aq1 qa!
command! AQ1 qa!

let g:gitgutter_max_signs = 10000
let g:CSApprox_verbose_level = 0
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:EasyMotion_leader_key = '<C-s>'
let g:EasyMotion_keys = 'uhetonasidbkmjxgycpfrlq;vz'
let g:EasyMotion_verbose = 0
let g:netrw_liststyle=0
let g:netrw_preview=1
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
let g:gundo_preview_bottom=1
let g:gundo_preview_height=25
let NERDTreeShowLineNumbers=1
let NERDTreeHighlightCursorline=1
let NERDTreeHijackNetrw=0
let g:netrw_browsex_viewer= $BROWSER
let g:netrw_dirhistmax = 0
" Use whole "words" when opening URLs.
" This avoids cutting off parameters (after '?') and anchors (after '#').
" See http://vi.stackexchange.com/q/2801/1631
let g:netrw_gx="<cWORD>"
let g:syntastic_racket_code_ayatollah_script = $HOME.'/.vim/bin/code-ayatollah'
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_c_checkers = ['gcc', 'make']
let g:syntastic_racket_checkers = ['code_ayatollah']
let g:syntastic_python_checkers = ['flake8', 'pep257', 'pep8', 'pyflakes',
                                  \'pylama', 'pylint', 'python']

let g:niji_matching_filetypes = ['lisp', 'scheme', 'racket', 'clojure',
                                \'sh', 'bash', 'zsh',
                                \'conf']
let g:niji_light_colours = [[248,  'NONE'], [37,  'NONE'], [207, 'NONE'], [124,  'NONE'],
                            \[34, 'NONE'], [127, 'NONE'], [203,  'NONE'], [63,  'NONE']]
let g:niji_dark_colours = g:niji_light_colours

if has("autocmd")
    autocmd BufReadPost *.rkt,*.rktl set filetype=racket
    autocmd FileType mail,gitcommit,gitsendemail setlocal textwidth=72
    autocmd BufEnter,WinEnter * 2mat ErrorMsg '\%81v.'
    autocmd BufWritePost * call SetTheme()
    autocmd WinEnter * :set winfixheight
    autocmd WinEnter * :wincmd =
    autocmd BufNewFile,BufReadPost *.md,*.markdown,*.mdown,*.mkd,*.mkdn
    \ set filetype=markdown
    autocmd filetype lisp,scheme,art,racket
                \ setlocal equalprg=$HOME/.vim/bin/scmindent/scmindent.rkt
    autocmd BufRead,BufNewFile *mutt-*
                \ setfiletype mail set spell spelllang=fi,en
    autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

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

if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

function! ConfirmQuit()
    let l:confirmed = confirm("Do you really want to quit?", "&Yes\n&No", 1)
    if l:confirmed == 1
        qall!
    endif
endf
command CQuit call ConfirmQuit()

function! GenerateReference()
    let chars='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    let ref=''

    for i in [1,2]
        " numero väliltä 0-61
        " let i=system("strings -n 1 < /dev/urandom | grep -o '[[:digit:]]'  | head -c1")
        let o=system("echo $(($RANDOM%62))")

        let ref=ref . chars[o]
    endfor

    exe "normal a_".ref."\<Esc>"
endf
command Ref call GenerateReference()

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

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction

function! NumList()
  let n = line("'>") - line("'<") + 1
  let i = line('.') - line("'<") + 1
  let pad = repeat(" ",(len(n)-len(i)))
  exe "normal 0i".pad.i.". \<Esc>0"
endf

function! Quotes()
  let line_count = line("'>") - line("'<") + 1
  let line_i = line('.') - line("'<") + 1

  if line_i == 1
      normal0i"
  else
      normal0i
      if line_i == line_count
          exe "normal 0A\"\<Esc>0"
      endif
  endif
endf

let s:status_file = substitute(expand('<sfile>:p'),
                               \'changecolour.vim$',
                               \'.misc/status', '')

let g:theme = "dark"
function! SetTheme()
    let in = readfile($HOME.'/.theme')
    if in[0] != g:theme
        if in[0] == "light"
            colorscheme mellowy
            let g:theme = "light"
        else
            colorscheme solarized
            let g:theme = "dark"
        endif

        if exists(':PowerlineReloadColorscheme')
            :PowerlineReloadColorscheme
        endif
    endif

    unlet in
endf

if &term == 'linux'
    colorscheme system16
else
    colorscheme solarized
endif

call SetTheme()
