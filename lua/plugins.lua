return {
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000, config = function() vim.cmd [[colorscheme moonfly]] end },
	{ "mbbill/undotree", config = function () vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle) end },
}
