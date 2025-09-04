require("nvchad.options")

-- add yours here!
vim.g.dap_virtual_text = true -- enable debug adapter protocol (DAP)
vim.opt.colorcolumn = "80"
vim.o.cursorlineopt = "both"

vim.o.undofile = true

-- Case-insensitive seaerch UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt for better completion experience
vim.o.completeopt = "menuone,noselect"

vim.o.termguicolors = true

vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline
