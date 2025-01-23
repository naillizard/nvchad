return {
	{
		"olimorris/codecompanion.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
			"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
			{ "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves the default Neovim UI
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "ollama",
					},
					inline = {
						adapter = "ollama",
					},
					agent = {
						adapter = "ollama",
					},
				},
				adapters = {
					anthropic = function()
						return require("codecompanion.adapters").extend("anthropic", {
							env = {
								api_key = "cmd:gopass -o api/claude/nvim",
							},
						})
					end,
				},
				opts = {
					log_level = "DEBUG",
				},
			})
		end,
	},
}
