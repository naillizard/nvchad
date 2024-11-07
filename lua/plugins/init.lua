return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- {
	--   "sourcegraph/sg.nvim",
	--   dependencies = { "nvim-lua/telescope.nvim" }, -- [[ "nvim-lua/plenary.nvim" ]] },
	-- },

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = require("configs.nvimtree"),
	},

	{
		"direnv/direnv.vim",
	},

	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
			"nvim-telescope/telescope.nvim", -- Optional: For using slash commands
			{ "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves the default Neovim UI
		},
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "anthropic",
					},
					inline = {
						adapter = "anthropic",
					},
					agent = {
						adapter = "anthropic",
					},
				},
				adapters = {
					anthropic = function()
						return require("codecompanion.adapters").extend("anthropic", {
							env = {
								api_key = "cmd:gopass show api/claude/nvim",
							},
						})
					end,
				},
			})
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				css = true,
				tailwind = true,
				virtualtext = "■",
			},
			filetypes = {
				"*",
				"!lazy",
			},
		},
		config = function(_, opts)
			require("colorizer").setup(opts)
		end,
	},

	{
		"sQVe/sort.nvim",
		config = function()
			require("sort").setup({})
		end,
	},

	{
		"tpope/vim-fugitive",
		lazy = false,
	},

	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"folke/trouble.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("chatgpt").setup({
				api_key_cmd = "pass show api/openai/nvchad",
				predefined_chat_gpt_prompts = "https://raw.githubusercontent.com/RocKing1001/awesome-chatgpt-prompts/main/prompts.csv",
				openai_params = {
					model = "gpt-4",
				},
				openai_edit_params = {
					model = "gpt-4",
				},
			})
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},

	{
		"NoahTheDuke/vim-just",
		ft = { "just" },
	},

	-- {
	-- 	"TheLeoP/powershell.nvim",
	-- 	---@type powershell.user_config
	-- 	opts = {
	-- 		bundle_path = vim.fn.bundle_path "data" .. "/mason/packages/powershell-editor-services",
	-- 	},
	-- },

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"arduino",
				"bicep",
				"comment",
				"css",
				"dockerfile",
				"editorconfig",
				"gdscript",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"html",
				"javascript",
				"jq",
				"json",
				"jsonc",
				"lua",
				"make",
				"nix",
				"powershell",
				"python",
				"sql",
				"terraform",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"php",
			},
		},
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
