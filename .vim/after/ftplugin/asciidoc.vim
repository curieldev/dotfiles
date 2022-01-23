nnoremap <buffer> <leader>op :silent AsciidoctorOpenPDF<CR>
nnoremap <buffer> <leader>oh :silent AsciidoctorOpenHTML<CR>
nnoremap <buffer> <leader>ch :silent Asciidoctor2HTML<CR>
nnoremap <buffer> <leader>cp :silent Asciidoctor2PDF<CR>
nnoremap <buffer> <leader>p :silent AsciidoctorPasteImage<CR>

augroup ON_ASCIIDOCTOR_SAVE | au!
    au BufWritePost *.adoc :silent Asciidoctor2HTML
    au BufWritePost *.adoc :silent FirefoxReload
augroup end

