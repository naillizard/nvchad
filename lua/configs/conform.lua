local options = {
	formatters_by_ft = {
		bicep = { "bicep" },
		css = { "prettier" },
		go = { "goimports", "gofmt" },
		justfile = { "just" },
		lua = { "stylua" },
		nix = { "alejandra" }, -- "alejandra" "nixpkgs_fmt"
		python = { "autopep8" },
		yaml = { "yamlfmt" },
		bash = { "beautysh" },
		sh = { "beautysh" },
		zsh = { "beautysh" },
		-- html = { "prettier" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
