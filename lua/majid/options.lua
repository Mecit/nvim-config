local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.wrap = false
opt.tabstop = 4
opt.swapfile = false
opt.winborder = "rounded"
vim.g.mapleader = " "

vim.diagnostic.config({
	signs = false,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
	virtual_text = {
		severity = { min = vim.diagnostic.severity.WARN },
	},
})
