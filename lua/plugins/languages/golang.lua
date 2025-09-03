local map = vim.keymap.set
return {
	{
		"ray-x/go.nvim",
		dependencies = {
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("go").setup()
		end,
		event = "CmdlineEnter",
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"mfussenegger/nvim-dap",
		},
		build = function()
			vim.cmd.GoInstallDeps()
		end,
		---@type gopher.Config
		opts = {},
	},
	-- {
	-- 	"leoluz/nvim-dap-go",
	-- 	ft = "go",
	-- 	dependencies = "mfussenegger/nvim-dap",
	-- 	config = function(_, opts)
	-- 		require("dap-go").setup(opts)
	-- 		-- debug go test
	-- 		map("n", "<leader>gdt", function()
	-- 			require("dap-go").debug_test()
	-- 		end, { desc = "Debug go test" })
	-- 		-- debug last go test
	-- 		map("n", "<leader>dgl", function()
	-- 			require("dap-go").debug_last()
	-- 		end, { desc = "Debug last go test" })
	-- 	end,
	-- },
}
