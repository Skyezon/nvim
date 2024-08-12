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
	{
		--find stuff
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim'
				,
				build = "make"
			}
		}
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	{
		--file tree
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}

	},
	{
		-- lsp package manager
		"williamboman/mason.nvim",
		build = ":MasonUpdate"         -- :MasonUpdate updates registry contents
	},
	"williamboman/mason-lspconfig.nvim", -- bridge mason with lsp
	"neovim/nvim-lspconfig",           -- base lsp
	"folke/tokyonight.nvim",           -- colorscheme	

	--nvim cmp stuff
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',
	'hrsh7th/nvim-cmp',
	'saadparwaiz1/cmp_luasnip',
	'L3MON4D3/LuaSnip',

	'tpope/vim-fugitive', -- git related stuff
    'tpope/vim-surround',

	'windwp/nvim-autopairs', -- autopair brackets like in vscode
	'nvim-lualine/lualine.nvim', -- better looking status line
	{
		'nvimdev/lspsaga.nvim', -- better looking lsp stuff
		dependencies = {
			'nvim-tree/nvim-web-devicons',
			'nvim-treesitter/nvim-treesitter'
		}

	},
	'numToStr/Comment.nvim', -- easier commenting anything
	'mbbill/undotree', -- better undo stuff
    'windwp/nvim-ts-autotag',
    'nvim-pack/nvim-spectre',
    'folke/trouble.nvim'
}

require("lazy").setup(plugins)
