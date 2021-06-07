let g:deoplete#enable_at_startup = 1

function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction "}}}

inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()

autocmd FileType TelescopePrompt
       \ call deoplete#custom#buffer_option('auto_complete', v:false)
