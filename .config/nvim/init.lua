require("config.lazy")
require("config.settings")

local neopywal = require("neopywal")
neopywal.setup({
	transparent_background = true,
	terminal_colors = true,
	show_end_of_buffer = false,
})
vim.cmd.colorscheme("neopywal")
