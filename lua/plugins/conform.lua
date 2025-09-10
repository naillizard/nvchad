return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = {
			formatters_by_ft = {
				-- css = { "prettier" },
				bash = { "beautysh" },
				elixir = { "mix" },
				go = { "golines", "goimports-reviser" },
				html = { "prettier" },
				justfile = { "just" },
				lua = { "stylua" },
				markdown = { "markdownlint" },
				nix = { "alejandra" }, -- "alejandra" "nixpkgs_fmt"
				nushell = { "nufmt" },
				python = { "autopep8" },
				rust = { "rustfmt", lsp_format = "fallback" },
				shfmt = { "beautysh" },
				terraform = { "terraform_fmt" },
				yaml = { "yamlfmt" },
				zsh = { "beautysh" },
			},

			formatters = {
				stylua = {
					-- enable on nixos
					-- command = "/home/ronin/.nix-profile/bin/stylua",
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
