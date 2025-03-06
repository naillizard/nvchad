-- load defaults i.e lua_lsp
local configs = require("nvchad.configs.lspconfig")

local lspconfig = require("lspconfig")

local home_dir = os.getenv("HOME")
if home_dir == nil then
	home_dir = os.getenv("USERPROFILE")
end

local bicep_lsp_bin = home_dir
	.. "/.local/share/nvim/mason/packages/bicep-lsp/extension/bicepLanguageServer/Bicep.LangServer.dll"
local omnisharp_lsp_bin = home_dir .. "/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll"
local powershell_es_lsp_bin = home_dir .. "/.local/share/nvim/mason/packages/powershell-editor-services"

return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- EXAMPLE
			local servers = {
				arduino_language_server = {},
				bicep = {
					cmd = { "dotnet", bicep_lsp_bin },
				},
				clangd = {},
				css_variables = {},
				cssls = {},
				docker_compose_language_service = {},
				dockerls = {},
				gdscript = {},
				gdshader_lsp = {},
				gopls = {
					settings = {
						gopls = {
							completeUnimported = true,
							usePlaceholders = true,
							analyses = {
								unusedparams = true,
							},
						},
					},
				},
				html = {},
				htmx = {},
				jsonls = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								globals = { "vim" },
							},
						},
					},
				},
				markdown_oxide = {},
				-- "nil_ls",
				omnisharp = {
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
				},
				powershell_es = {
					bundle_path = powershell_es_lsp_bin,
					settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
				},
				ruff = {},
				tailwindcss = {},
				ts_ls = {},
				vimls = {},
				yamlls = {
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
				},
			}

			-- lsps with default config
			for name, opts in ipairs(servers) do
				opts.on_init = configs.on_init
				opts.on_attach = configs.on_attach
				opts.capabilities = configs.capabilities

				require("lspconfig")[name].setup(opts)
			end
		end,
	},
}
