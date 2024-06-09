local globals = require("globals")

local ok_status, lualine = pcall(require, "lualine")
if not ok_status then
	vim.notify("ERROR: Failed to load lualine.")
	return
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "gruvbox",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				icons_enabled = true,
				icon = "", -- removing this icon may cause anomalous events.
			},
		},
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = {
			{
				"filename",
				file_status = true,
				newfile_status = true,
				path = 1, -- relative path
				shorting_target = 30,
				symbols = {
					modified = globals.modified_symbol,
					readonly = globals.readonly_symbol,
					unnamed = globals.unnamed_symbol,
					newfile = globals.newfile_symbol,
				},
			},
		},
		lualine_x = {
			"encoding",
			"filesize",
			{
				"filetype",
				colored = true,
				icon_only = true,
				padding = {
					left = 1,
					right = 0,
				},
			},
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
