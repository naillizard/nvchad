require("nvchad.configs.lspconfig").defaults()
local lspconfig = require("lspconfig")

local home_dir = os.getenv("HOME")
if home_dir == nil then
	home_dir = os.getenv("USERPROFILE")
end

local bicep_lsp_dll = home_dir .. "/.nix-profile/lib/bicep/Bicep.LangServer.dll"
local powershell_es_lsp_bin = home_dir .. "/.nix-profile/lib/powershell-editor-services"
local lua_ls = home_dir .. "/.nix-profile/bin/lua-language-server"

local servers = {
	ansiblels = {
		filetypes = { "yaml.ansible" },
		root_dir = require("lspconfig.util").root_pattern(".git", "ansible.cfg", ".ansible-lint"),
		settings = {},
	},
	arduino_language_server = {},
	bashls = {},
	bicep = {
		cmd = { "dotnet", bicep_lsp_dll },
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
	jsonls = {},
	lua_ls = {
		cmd = { lua_ls },
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	markdown_oxide = {},
	nixd = {},
	vimls = {},
	vuels = {},
	powershell_es = {
		bundle_path = powershell_es_lsp_bin,
		settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
	},
	tailwindcss = {},
	terraformls = {
		-- cmd = { "terraform-ls", "serve" },
		-- filetypes = { "terraform", "tf" },
		-- root_dir = require("lspconfig.util").root_pattern(".terraform", ".git", "*.tf"),
	},
	ts_ls = {},
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
	zls = {},
}

-- advanced way, supports additional options passed to the setup of each server
for server, config in pairs(servers) do
	if config then
		lspconfig[server].setup(config)
	end
end

-- simpler way, but does not support options
-- vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
