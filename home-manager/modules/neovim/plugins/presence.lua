local status_ok, presence = pcall(require, "presence")
if not status_ok then
	return
end

local config = {
	buttons = {
		{
			label = "GitHub Profile",
			url = "https://github.com/DarkAngel285",
		},
	},
}

presence.setup(config)