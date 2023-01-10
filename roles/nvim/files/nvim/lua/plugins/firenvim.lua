return {
	"glacambre/firenvim",
	build = function()
		vim.fn["firenvim#install"](0)
	end,
	config = function()
		vim.cmd([[
			if exists('g:started_by_firenvim')
				let g:firenvim_config = {
						\ 'globalSettings': {
							\ 'alt': 'all',
						\  },
						\ 'localSettings': {
							\ '.*': {
								\ 'cmdline': 'firenvim',
								\ 'content': 'text',
								\ 'priority': 0,
								\ 'selector': 'textarea',
								\ 'takeover': 'always',
							\ },
							\ '(outlook|atlassian)*': {
								\ 'takeover': 'never',
								\ 'priority': 1
							\ },
						\ }
					\ }
				au BufEnter github.com_*.txt set filetype=markdown
			endif
			]])
	end,
}
