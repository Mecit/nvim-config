vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.swapfile = false
vim.o.winborder = "rounded"
vim.g.mapleader = " "

vim.diagnostic.config({
	signs = false, -- show in gutter
	underline = true, 
	update_in_insert = true,
	severity_sort = true,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
})





