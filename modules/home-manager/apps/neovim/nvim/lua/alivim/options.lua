local o = vim.opt
vim.g.mapleader = " "
vim.g.maplocalleader = " "
o.clipboard = "unnamedplus"
o.number = true
o.relativenumber = true
o.showmode = false
o.ignorecase = true
o.smartcase = true
o.updatetime = 250
o.timeoutlen = 300
o.splitright = true
o.splitbelow = true
o.signcolumn = "yes"
o.list = true
o.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
o.inccommand = "split"
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.updatetime = 300
o.termguicolors = true
o.mouse = "a"
o.scrolloff = 10
o.hlsearch = true
o.conceallevel = 1

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.g.firenvim_config = {
	globalSettings = { alt = "all" },
	localSettings = {
		[".*"] = { takeover = "never" },
		["https://www.shadertoy.com/"] = {
			filename = "/tmp/{hostname}_{pathname%10}.frag",
		},
	},
}
-- vim.cmd("colorscheme tokyonight")

-- vim.keymap.set("n", "<leader>w", "<cmd>w<cr>")
-- vim.keymap.set("n", "<leader>q", "<cmd>q<cr>")
