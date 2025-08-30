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
						adapter = "openai",
					},
					inline = {
						adapter = "openai",
					},
					agent = {
						adapter = "openai",
					},
				},
				adapters = {
					http = {
						openai = function()
							return require("codecompanion.adapters").extend("openai", {
								env = {
									api_key = "cmd:gopass -o ai/openai/nvchad",
								},
							})
						end,
						anthropic = function()
							return require("codecompanion.adapters").extend("anthropic", {
								env = {
									api_key = "cmd:gopass -o ai/claude",
								},
							})
						end,
					},
				},
				prompt_library = {
					["Generate a Commit Message"] = {
						prompts = {
							{
								role = "user",
								content = function()
									return string.format(
										[[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me, always follow the 50/72 rule, the subject line cannot exceed 50 characters in length and each line in the body cannot exceed 72 characters in length:

```diff
%s
```
]],
										vim.fn.system("git diff --no-ext-diff --staged")
									)
								end,
								opts = {
									contains_code = true,
								},
							},
						},
					},
				},
				opts = {
					log_level = "DEBUG",
				},
			})
		end,
	},
}
