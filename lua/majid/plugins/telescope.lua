vim.pack.add({
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope-file-browser.nvim' },
})

local builtin = require('telescope.builtin')
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
