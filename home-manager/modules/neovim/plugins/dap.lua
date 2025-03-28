local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

dap.adapters = {
	gdb = {
		type = "executable",
		command = "gdb",
		args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
	},
	codelldb = {
		type = "server",
		port = "${port}",
		executable = {
			command = codelldb_bin,
			args = { "--port", "${port}" },
		},
	},
	godot = {
		type = "server",
		host = "127.0.0.1",
		port = 6006,
	},
}

dap.configurations = {
	c = {
		{
			name = "Launch via codelldb",
			type = "gdb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopAtBeginningOfMainSubprogramm = false,
			stopOnEntry = false,
			runInTerminal = true,
			terminal = "integrated",
			args = {},
		},
	},
	cpp = {
		{
			name = "Launch via codelldb",
			type = "codelldb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			runInTerminal = true,
			terminal = "integrated",
			args = {},
		},
	},
	gdscript = {
		{
			name = "Launch scene",
			type = "godot",
			request = "launch",
			project = "${workspaceFolder}",
			launch_scene = true,
		},
	},
}

local dapui_ok, dapui = pcall(require, "dapui")
if not dapui_ok then
	return
end

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
