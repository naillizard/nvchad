require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- fugitive
map("n", "<leader>gs", "<cmd> 0Git <CR>", { desc = "Open fugitive" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- map("n", "<silent>go", "<Cmd>Sort<CR>")
-- map("v", "<silent>go", "<Esc><Cmd>Sort<CR>")
--
map("n", "<silent>go", "<cmd>Sort<CR>", { desc = "Sort Strings" })
map("v", "<silent>go", "<ESC><cmd>Sort<CR>", { desc = "Sort Strings" })
-- vim.cmd [[
--   nnoremap <silent> go <Cmd>Sort<CR>
--   vnoremap <silent> go <Esc><Cmd>Sort<CR>
-- ]]
--
-- just
map("n", "<leader>j", ":!just<CR>", { silent = true })
