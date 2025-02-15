local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local config = {
	size = 10,
	open_mapping = [[<C-\>]],
	hide_number = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
}

toggleterm.setup(config)
