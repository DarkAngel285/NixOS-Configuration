local status_ok, conform = pcall(require, "conform")
if not status_ok then
	return
end

local config = {
	format_on_save = function(bufnr)
		if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
			return
		end
		return { timeout_ms = 500, lsp_format = "fallback" }
	end,
	formatters_by_ft = {
		nix = { "nixfmt" },
		lua = { "stylua" },
		java = { "uncrustify" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		cmake = { "cmake_format" },
		bash = { "shfmt" },
		python = { "black" },
		godot = { "gdformat" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		svelte = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		html = { "superhtml" },
		cs = { "csharpier" },
		["_"] = { "codespell", "trim_whitespace" },
	},
}

vim.api.nvim_create_user_command("FormatDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable autoformat-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("FormatEnable", function(args)
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable autoformat-on-save",
})

conform.setup(config)
