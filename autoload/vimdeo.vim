" REQUIREMENTS
" pip install opencv-python


if exists("g:vimdeo_load_files")
    finish
endif
let g:vimdeo_load_files = 1

function! vimdeo#loadFiles()
    runtime lib/vimdeo.vim
    runtime plugin/vimdeo/ui_glue.vim
endfunction




