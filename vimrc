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
map <C-e> <esc>:w<CR>
map <C-a> <esc>:qa!<CR>
map <leader>r <esc>:silent !test -f update_pdf && ./update_pdf<CR><esc>:redraw!<CR>
imap <C-e> <esc>:w<CR>
imap <C-a> <esc>:qa!<CR>
cmap <C-e> <esc>:w<CR>
cmap <C-a> <esc>:qa!<CR>

nnoremap j gj
nnoremap k gk
nnoremap <leader>a <C-a>
nnoremap <leader>x <C-x>
nnoremap <leader>2 :tabnext<cr>
nnoremap <leader>1 :tabprevious<cr>
nnoremap <leader><leader> <c-^>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>m <C-w>s<C-w>j
nnoremap <silent> n n:call HLNext(0.4)<cr>
nnoremap <silent> N N:call HLNext(0.4)<cr>
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
cnoremap w!! w !sudo tee % >/dev/null
vnoremap <leader>a :call Incr()<CR>
vnoremap <leader>d :call NumList()<CR>


nmap H <Plug>Sneak_S
omap H <Plug>Sneak_S
xmap H <Plug>Sneak_S

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
let g:EasyMotion_leader_key = '<C-\>'
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
let g:syntastic_racket_code_ayatollah_script = $HOME.'/.vim/bin/code-ayatollah'
let g:syntastic_ruby_checkers = ['mri']
let g:syntastic_c_checkers = ['gcc', 'make']
let g:syntastic_racket_checkers = ['code_ayatollah']
let g:syntastic_python_checkers = ['flake8', 'pep257', 'pep8', 'pyflakes',
                                  \'pylama', 'pylint', 'python']

let g:niji_matching_filetypes = ['lisp', 'scheme', 'racket', 'clojure',
                                \'sh', 'bash', 'zsh',
                                \'conf']
let g:niji_light_colours = [[248,  66], [37,  66], [207, 66], [124,  66],
                            \[34, 66], [127, 66], [203,  66], [63,  66]]
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
    "export DJANGO_SETTINGS_MODULE=project.settings"
EOF
endif

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

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

let s:status_file = substitute(expand('<sfile>:p'),
                               \'changecolour.vim$',
                               \'.misc/status', '')

let g:theme = "dark"
function! SetTheme()
    let in = readfile('/home/mika/.theme')
    if in[0] != g:theme
        if in[0] == "light"
            colorscheme mellowy
            let g:theme = "light"
        else
            colorscheme solarized
            let g:theme = "dark"
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
