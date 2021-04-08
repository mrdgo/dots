"init.vim: source $HOME/.config/nvim/config/denite.vim
" dein.vim
"call dein#add('Shougo/denite.nvim')
"call dein#add('Shougo/neoyank.vim')

nmap <silent> <Leader>us :<C-u>Denite grep:. -no-empty<cr>
nmap <silent> <Leader>ua :<C-u>DeniteCursorWord grep:.<cr>
nmap <silent> <Leader>uc <cmd>Denite command_history<cr>
nmap <silent> <Leader>uh <cmd>Denite help<cr>
nmap <silent> <Leader>ul <cmd>Denite line<cr>

nmap <silent> <Leader>ub <cmd>Denite buffer<cr>
nmap <silent> <Leader>uf <cmd>Denite file/rec<cr>

" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> s
  \ denite#do_map('do_action', 'split')
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> t
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> y
  \ denite#do_map('do_action', 'yank')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

let g:neoyank#file = '/opt/dots/nvim/history_yank'
call denite#custom#var('buffer', 'date_format', '')

let s:denite_options = {'default' : {
            \ 'split': 'floating',
            \ 'start_filter': 1,
            \ 'auto_resize': 1,
            \ 'prompt': 'λ ',
            \ 'unique': 1,
            \ 'smartcase': 1,
            \ 'source_names': 'hide',
            \ 'winrow': 1,
            \ 'wincol': 1,
            \ 'winwidth': &columns,
            \ 'vertical_preview': 1
            \ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
    for l:fname in keys(a:opts)
        for l:dopt in keys(a:opts[l:fname])
            call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
        endfor
    endfor
endfunction

call s:profile(s:denite_options)

"call denite#custom#var('warnings',)
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of grep
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

"" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
