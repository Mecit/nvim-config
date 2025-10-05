vim.pack.add({
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "elixir", "lua", "vim", "bash", "json", "html", "javascript" },
	highlight = { enable = true },
	indent = { enable = true },
})
