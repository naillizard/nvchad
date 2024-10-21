-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- EXAMPLE
local servers = {
	"arduino_language_server",
	"bicep",
	"clangd",
	"css_variables",
	"cssls",
	"docker_compose_language_service",
	"dockerls",
	"gdscript",
	"gdshader_lsp",
	"gopls",
	"html",
	"htmx",
	"jsonls",
	"lua_ls",
	"markdown_oxide",
	"nil_ls",
	"omnisharp",
	"powershell_es",
	"ruff",
	"ts_ls",
	"vimls",
	"yamlls",
}
local nvlsp = require("nvchad.configs.lspconfig")

-- lsps with default config
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = nvlsp.on_attach,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
	})
end

local bicep_lsp_bin =
	"/home/ronin/.local/share/nvim/mason/packages/bicep-lsp/extension/bicepLanguageServer/Bicep.LangServer.dll"
local omnisharp_lsp_bin = "/home/ronin/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"

lspconfig.bicep.setup({
	cmd = { "dotnet", bicep_lsp_bin },
	filetypes = { "bicep", "bicepparam" },
})

lspconfig.omnisharp.setup({
	cmd = { "dotnet", omnisharp_lsp_bin },
	settings = {
		FormattingOptions = {
			-- Enables support for reading code style, naming convention and analyzer
			-- settings from .editorconfig.
			EnableEditorConfigSupport = true,
			-- Specifies whether 'using' directives should be grouped and sorted during
			-- document formatting.
			OrganizeImports = true,
		},
		MsBuild = {
			-- If true, MSBuild project system will only load projects for files that
			-- were opened in the editor. This setting is useful for big C# codebases
			-- and allows for faster initialization of code navigation features only
			-- for projects that are relevant to code that is being edited. With this
			-- setting enabled OmniSharp may load fewer projects and may thus display
			-- incomplete reference lists for symbols.
			LoadProjectsOnDemand = nil,
		},
		RoslynExtensionsOptions = {
			-- Enables support for roslyn analyzers, code fixes and rulesets.
			EnableAnalyzersSupport = nil,
			-- Enables support for showing unimported types and unimported extension
			-- methods in completion lists. When committed, the appropriate using
			-- directive will be added at the top of the current file. This option can
			-- have a negative impact on initial completion responsiveness,
			-- particularly for the first few completion sessions after opening a
			-- solution.
			EnableImportCompletion = nil,
			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
			-- true
			AnalyzeOpenDocumentsOnly = nil,
		},
		Sdk = {
			-- Specifies whether to include preview versions of the .NET SDK when
			-- determining which version to use for project loading.
			IncludePrereleases = true,
		},
	},
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lspconfig.yamlls.setup({
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
			},
			schemaStore = {
				enable = true,
			},
		},
	},
})

lspconfig.powershell_es.setup({
	settings = {
		bundle_path = "/home/ronin/.local/share/nvim/mason/packages/powershell-editor-services/PowerShellEditorServices",
		settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
	},
})

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
