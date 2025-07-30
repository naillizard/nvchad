require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local general = augroup("General Settings", { clear = true })

autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "*.bicep",
	callback = function()
		vim.bo.filetype = "bicep"
	end,
	group = general,
	desc = "Set Bicep filetype",
})

autocmd({ "BufWritePre" }, {
	pattern = { "*.tf", "*.tfvars" },
	callback = function()
		-- vim.bo.filetype = "terraform"
		vim.lsp.buf.format()
	end,
	group = general,
	desc = "Set Terraform filetype",
})

autocmd({ "BufNewFile", "BufRead" }, {
	pattern = {
		"*/playbooks/*.yml",
		"*/playbooks/*.yaml",
		"roles/**/tasks/*.yml",
		"roles/**/tasks/*.yaml",
		"inventory/**/*.ym?al",
	},
	callback = function()
		vim.bo.filetype = "yaml.ansible"
	end,
	group = general,
	desc = "Set filetype to yaml.ansible for Ansible files",
})

autocmd({ "BufNewFile", "BufRead" }, {
	pattern = "/dev/shm/gopass*",
	callback = function()
		vim.opt_local.swapfile = false
		vim.opt_local.backup = false
		vim.opt_local.undofile = false
		vim.opt_local.shadafile = ""
	end,
	group = general,
	desc = "Disable swap/backup/undo/shada for gopass",
})

-- vim.cmd([[ autocmd BufNewFile,BufRead *.bicep set filetype=bicep ]])

-- vim.cmd([[ autocmd BufNewFile,BufRead *.tf set filetype=terraform ]])

-- vim.cmd([[ autocmd BufNewFile,BufRead /dev/shm/gopass* set setlocal noswapfile nobackup noundofile shada="" ]])

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
	},
})
