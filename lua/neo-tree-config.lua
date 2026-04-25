vim.api.nvim_create_autocmd('VimEnter', {
	callback = function()
		require('neo-tree').setup({
			window = { width = 25, position = "left" },
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = true,
				},
				follow_current_file = { enabled = true },
			},
		})
	end,
})
