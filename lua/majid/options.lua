vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.g.mapleader = " "
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.pack.add({
	{ src = 'https://github.com/neovim/nvim-lspconfig' },
	{ src = 'https://github.com/catppuccin/nvim',                           name = 'catppuccin' },
	{ src = 'https://github.com/nvim-lua/plenary.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope.nvim' },
	{ src = 'https://github.com/nvim-telescope/telescope-file-browser.nvim' },
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },
	{ src = 'https://github.com/mason-org/mason.nvim' },
	{ src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
	{ src = 'https://github.com/hrsh7th/nvim-cmp' },
	{ src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
	{ src = 'https://github.com/hrsh7th/cmp-buffer' },
	{ src = 'https://github.com/hrsh7th/cmp-path' },
	{ src = 'https://github.com/hrsh7th/cmp-cmdline' },
	{ src = 'https://github.com/L3MON4D3/LuaSnip' },
})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "elixir", "lua", "vim", "bash", "json", "html", "javascript" },
	highlight = { enable = true },
	indent = { enable = true },
})


require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "lua_ls", "elixirls" }
}

local cmp = require 'cmp'

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})

-- Remove "undefined global vim" error
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" }
			}
		}
	}
})

vim.diagnostic.config({
	signs = false, -- show in gutter
	underline = true, -- underline problems
	update_in_insert = true,
	severity_sort = true,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
})

require('lualine').setup()

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.cmd("colorscheme catppuccin-frappe")

local builtin = require('telescope.builtin')
require("telescope").load_extension "file_browser"

vim.keymap.set('n', '<leader>ff', builtin.find_files)
vim.keymap.set('n', '<leader>fg', builtin.live_grep)
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>')
vim.keymap.set('n', '<leader>fh', builtin.help_tags)
