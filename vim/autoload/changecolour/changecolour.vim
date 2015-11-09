if exists("g:loaded_changecolour")
    exit 1
endif

let g:loaded_changecolour = 1
let s:status_file = substitute(expand('<sfile>:p'),
                               \'changecolour.vim$',
                               \'.misc/status', '')

function! changecolour#changecolour#change_colour()
    let l:colour_status = s:read_colour_status()

    if l:colour_status == "dark"
        call s:save_colour_status("light")
        let s:current_theme = "light"
    else
        call s:save_colour_status("dark")
        let s:current_theme = "dark"
    endif

    call changecolour#changecolour#set_colour()
endfunction

function! changecolour#changecolour#set_colour()
    if s:current_theme == "light"
        colorscheme system16_light
    else
        colorscheme system16
    endif
endfunction

function! changecolour#changecolour#update_colour()
    let l:colour_status = s:read_colour_status()

    if l:colour_status != s:current_theme
        let s:current_theme = l:colour_status
        call changecolour#changecolour#set_colour()
    endif
endfunction

function! s:read_colour_status()
    let l:status = readfile(s:status_file)
    return l:status[0]
endfunction

function! s:save_colour_status(status)
    if a:status == "light"
        call writefile(["light"], s:status_file)
    else
        call writefile(["dark"], s:status_file)
    endif
endfunction

if !filereadable(s:status_file)
    call writefile(["dark"], s:status_file)
    let s:current_theme = "dark"
else
    let s:current_theme = s:read_colour_status()
endif

command! CC call changecolour#changecolour#change_colour()
command! SC call changecolour#changecolour#set_colour()
command! UC call changecolour#changecolour#update_colour()
