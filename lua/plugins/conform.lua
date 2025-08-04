return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = {
			formatters_by_ft = {
				bash = { "beautysh" },
				-- css = { "prettier" },
				go = { "golines", "goimports-reviser" },
				html = { "prettier" },
				justfile = { "just" },
				lua = { "stylua" },
				markdown = { "markdownlint" },
				nix = { "alejandra" }, -- "alejandra" "nixpkgs_fmt"
				nushell = { "nufmt" },
				python = { "autopep8" },
				rust = { "rustfmt", lsp_format = "fallback" },
				terraform = { "terraform_fmt" },
				sh = { "beautysh" },
				yaml = { "yamlfmt" },
				zsh = { "beautysh" },
			},

			formatters = {
				stylua = {
					command = "/home/ronin/.nix-profile/bin/stylua",
				},
			},

			format_on_save = {
				-- These options will be passed to conform.format()
				lsp_format = "fallback",
				timeout_ms = 500,
			},

			log_level = vim.log.levels.DEBUG,
		},
	},
}
