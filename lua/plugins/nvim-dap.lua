local map = vim.keymap.set

return {
	-- {
	-- 	"mfussenegger/nvim-dap",
	-- 	init = function()
	-- 		-- go dap mappings
	-- 		map("n", "<leader>db", "<cmd>DapToggleBreakpoint <CR>", { desc = "Add breakpoint at line" })
	-- 		-- open debugging sidebar
	-- 		map("n", "<leader>dus", function()
	-- 			local widgets = require("dap.ui.widgets")
	-- 			local sidebar = widgets.sidebar(widgets.scopes)
	-- 			sidebar.open()
	-- 		end, { desc = "Open debugging sidebar" })
	-- 	end,
	-- },
	-- { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
}
