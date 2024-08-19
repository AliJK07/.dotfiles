-- require("which-key").setup()
--
-- -- Document existing key chains
-- require("which-key").register({
-- 	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
-- 	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
-- 	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
-- 	["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
-- 	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
-- })
local wk = require("which-key")
wk.add({
	{ "<leader>f", group = "file" }, -- group
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
	{
		"<leader>fb",
		function()
			print("hello")
		end,
		desc = "Foobar",
	},
	{ "<leader>fn", desc = "New File" },
	{ "<leader>f1", hidden = true }, -- hide this keymap
	{ "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
	{
		"<leader>b",
		group = "buffers",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	{
		-- Nested mappings are allowed and can be added in any order
		-- Most attributes can be inherited or overridden on any level
		-- There's no limit to the depth of nesting
		mode = { "n", "v" }, -- NORMAL and VISUAL mode
		{ "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
		{ "<leader>w", "<cmd>w<cr>", desc = "Write" },
	},
})
