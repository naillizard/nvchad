return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = {
			formatters_by_ft = {
				bash = { "beautysh" },
				blade = { "blade-formatter" },
				css = { "prettier" },
				go = { "goimports", "gofmt" },
				html = { "prettier" },
				justfile = { "just" },
				lua = { "stylua" },
				markdown = { "markdownlint" },
				nix = { "alejandra" }, -- "alejandra" "nixpkgs_fmt"
				python = { "autopep8" },
				rust = { "rustfmt", lsp_format = "fallback" },
				sh = { "beautysh" },
				yaml = { "yamlfmt" },
				zsh = { "beautysh" },
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
