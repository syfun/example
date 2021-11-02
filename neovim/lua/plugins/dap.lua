local present, dap = pcall(require, "dap")
if not present then
	return
end

dap.configurations.python = {
	{

		-- The first three options are required by nvim-dap
		type = "executable", -- the type here established the link to the adapter definition: `dap.adapters.python`
		request = "launch",
		command = "/Users/sunyu/.pyenv/versions/graphite/bin/python",
		-- name = "Launch file",
		args = { "-m", "debugpy.adapter" },

		-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		-- program = "${file}", -- This configuration will launch the current file if used.
	},
}

require("dapui").setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
		open_on_start = true,
		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.25, -- Can be float or integer > 1
			},
			{ id = "breakpoints", size = 0.25 },
			{ id = "stacks", size = 0.25 },
			{ id = "watches", size = 00.25 },
		},
		width = 40,
		position = "left", -- Can be "left" or "right"
	},
	tray = {
		open_on_start = true,
		elements = { "repl" },
		height = 10,
		position = "bottom", -- Can be "bottom" or "top"
	},
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})
