local options = {
	formatters_by_ft = {
		bash = { "beautysh" },
		bicep = { "bicep" },
		css = { "prettier" },
		go = { "goimports", "gofmt" },
		html = { "prettier" },
		justfile = { "just" },
		lua = { "stylua" },
		nix = { "alejandra" }, -- "alejandra" "nixpkgs_fmt"
		python = { "autopep8" },
		sh = { "beautysh" },
		yaml = { "yamlfmt" },
		zsh = { "beautysh" },
		blade = { "blade-formatter" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
