require("nvchad.options")

-- add yours here!
vim.g.dap_virtual_text = true -- enable debug adapter protocol (DAP)
vim.opt.colorcolumn = "80"

vim.cmd([[ autocmd BufNewFile, BufRead *.bicep set filetype=bicep ]])

vim.cmd([[ autocmd BufNewFile, BufRead /dev/shm/gopass* set setlocal noswapfile nobackup noundofile shada="" ]])

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
	},
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
