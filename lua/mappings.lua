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

map("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "code companion actions" })
map("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true, desc = "code companion actions" })
map(
	"n",
	"<LocalLeader>a",
	"<cmd>CodeCompanionChat Toggle<cr>",
	{ noremap = true, silent = true, desc = "code companion chat" }
)
map(
	"v",
	"<LocalLeader>a",
	"<cmd>CodeCompanionChat Toggle<cr>",
	{ noremap = true, silent = true, desc = "code companion chat" }
)
map("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true, desc = "code companion chat add" })

map("n", "<leader>fd", "<cmd>Telescope git_files<cr>", { silent = true, desc = "telescope find git files" })

-- omnisharp mappings
-- map("n", "gr", function()
-- 	require("omnisharp_extended").telescope_lsp_references(
-- 		require("telescope.themes").get_ivy({ excludeDefinition = true })
-- 	)
-- end, { noremap = true, desc = "Omnisharp: References (excluding definitions)" })
--
-- map("n", "gd", function()
-- 	require("omnisharp_extended").telescope_lsp_definition()
-- end, { noremap = true, desc = "Omnisharp: Go to definition" })
--
-- map("n", "<leader>D", function()
-- 	require("omnisharp_extended").telescope_lsp_references()
-- end, { noremap = true, desc = "Omnisharp: References" })
--
-- map("n", "gi", function()
-- 	require("omnisharp_extended").telescope_lsp_implementation()
-- end, { noremap = true, desc = "Omnisharp: Go to implementation" })
