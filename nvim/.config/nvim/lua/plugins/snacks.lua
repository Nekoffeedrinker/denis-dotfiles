return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		explorer = { enabled = true },
		picker = { enabled = true },
		terminal = {
			win = { style = "terminal", height = 0.3 },
		},
	},
	keys = {
		-- Top Pickers & Explorer
		{ "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
		{ "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
		{ "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
		{ "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
		{ "<leader>n", function() Snacks.picker.notifications() end, desc = "Notification History" },
		{ "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
		-- Buffers (Doom-style)
		{ "<leader>bb", function() Snacks.picker.buffers() end, desc = "Listar buffers" },
		-- Terminal
		{ "<leader>ft", function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, desc = "Terminal (Root Dir)" },
		{ "<leader>fT", function() Snacks.terminal(nil, { cwd = vim.fn.expand("%:p:h") }) end, desc = "Terminal (cwd)" },
		{ "<c-/>",      function() Snacks.terminal(nil, { cwd = vim.fn.getcwd() }) end, desc = "Terminal (Root Dir)", mode = { "n", "t" } },
	}
}
