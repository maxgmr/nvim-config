local status_ok, conform = pcall(require, "conform")
if not status_ok then
	vim.notify("ERROR: Failed to load Conform.")
	return
end

conform.setup({
	format_on_save = {
		timeout_ms = 10000,
		lsp_fallback = true,
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		json = { "prettierd" },
		java = { "google-java-format" },
		markdown = { "prettierd" },
		html = { "prettierd" },
		bash = { "shfmt" },
		toml = { "taplo" },
		css = { "prettierd" },
		rust = { "rustfmt" },
		python = { "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },
		cs = { "csharpier" },
		xml = { "xmllint" },
		sql = { "sqlfluff" },
	},
})
