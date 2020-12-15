tnoremap <leader><leader> <C-\><C-n>

nmap <leader>do :Deol<cr>

let g:deol#prompt_pattern = ""
let g:deol#custom_map = {
	\ 'edit': 'e',
	\ 'start_insert': 'i',
	\ 'start_insert_first': 'I',
	\ 'start_append': 'a',
	\ 'start_append_last': 'A',
	\ 'execute_line': '<CR>',
	\ 'previous_prompt': '<leader>k',
	\ 'next_prompt': '<leader>j',
	\ 'paste_prompt': '<leader>p',
	\ 'bg': '<leader>sp',
	\ 'quit': '<leader>q',
	\ }

