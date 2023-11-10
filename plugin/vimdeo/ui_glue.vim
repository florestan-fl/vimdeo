

if exists("g:loaded_vimdeo_ui_glue_autoload")
    finish
endif
let g:loaded_vimdeo_ui_glue_autoload = 1

function! vimdeo#ui_glue#setupCommands()
    command! -complete=file -nargs=1 Vplay :call vimdeo#Play(<q-args>)
endfunction



