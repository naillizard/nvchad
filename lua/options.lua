require("nvchad.options")

-- add yours here!
vim.g.dap_virtual_text = true -- enable debug adapter protocol (DAP)
vim.opt.colorcolumn = "80"

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General Settings", { clear = true })

-- autocmd("BufEnter", {
-- 	pattern = "*.bicepparam",
-- 	callback = function()
-- 		vim.bo.filetype = "bicep"
-- 	end,
-- 	group = general,
-- 	desc = "Set bicepparam filetype to bicep",
-- })

vim.cmd([[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]])

vim.cmd([[ autocmd BufNewFile,BufRead /dev/shm/gopass* set setlocal noswapfile nobackup noundofile shada="" ]])

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
	},
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
