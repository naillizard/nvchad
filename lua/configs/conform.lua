local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "alejandra" }, -- "alejandra" "nixpkgs_fmt"
		go = { "goimports", "gofmt" },
		bicep = { "bicep" },
		justfile = { "just" },
		yaml = { "yamlfmt" },
		css = { "prettier" },
		-- html = { "prettier" },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_fallback = true,
	},
}

return options
