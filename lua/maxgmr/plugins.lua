-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- use a protected call so no errors on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	vim.notify("ERROR: Failed to load Lazy.nvim.")
	return
end

-- install/load plugins
lazy.setup({
	"folke/lazy.nvim", -- self-maintain

	"nvim-lua/plenary.nvim", -- standard helpers

	"ellisonleao/gruvbox.nvim", -- colour scheme

	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-nvim-lsp", -- lsp completion
	"hrsh7th/cmp-buffer", -- buffer completion
	"hrsh7th/cmp-path", -- path completion
	-- "hrsh7th/cmp-cmdline", -- snippet completion
	"hrsh7th/cmp-nvim-lua", -- nvim's lua api

	"saecki/crates.nvim", -- crates.io deps completion
	"David-Kunz/cmp-npm", -- npm packages completion
	"saadparwaiz1/cmp_luasnip", -- luasnip completion
	"zjp-CN/nvim-cmp-lsp-rs", -- rust analyzer completion
	"L3MON4D3/LuaSnip", -- snippet engine
	"rafamadriz/friendly-snippets", -- large collection of snippets

	"williamboman/mason.nvim", -- lsp manager/installer
	"williamboman/mason-lspconfig.nvim", -- connector btwn mason & lspconfig
	"neovim/nvim-lspconfig", -- enable lsp
	{
		"stevearc/conform.nvim", -- formatting
		opts = {},
	},

	"nvim-telescope/telescope.nvim", -- enable telescope

	{
		"nvim-treesitter/nvim-treesitter", -- enable syntax highlighting
		build = ":TSUpdate",
	},

	"windwp/nvim-autopairs", -- enable autopairing

	"numToStr/Comment.nvim", -- easily comment stuff
	"JoosepAlviste/nvim-ts-context-commentstring", -- context-aware comments

	"nvim-tree/nvim-web-devicons", -- misc icons
	"nvim-tree/nvim-tree.lua", -- file tree browser

	"willothy/nvim-cokeline", -- buffer line
	"nvim-lualine/lualine.nvim", -- bottom status line

	{
		"akinsho/toggleterm.nvim", -- terminal
		version = "*",
		config = true,
	},

	"goolord/alpha-nvim", -- start screen
})
