local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

	{'nvim-telescope/telescope.nvim',
	tag = '0.1.1',
	dependencies = {{'nvim-lua/plenary.nvim'}}	
},
{"nvim-treesitter/nvim-treesitter",
build = ":TSUpdate"
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}

	},
	{
		 "williamboman/mason.nvim",
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},
	{
		"williamboman/mason-lspconfig.nvim"
	},
	{
		"neovim/nvim-lspconfig"
	},
	{
		"folke/tokyonight.nvim"
	}

}

require("lazy").setup(plugins)
