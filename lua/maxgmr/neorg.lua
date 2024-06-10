local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
	vim.notify("ERROR: Failed to load neorg.")
	return
end

neorg.setup()
