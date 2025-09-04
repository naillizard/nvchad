require("nvchad.configs.lspconfig").defaults()
local lspconfig = require("lspconfig")

local home_dir = os.getenv("HOME")
if home_dir == nil then
	home_dir = os.getenv("USERPROFILE")
end

-- Detect if running on NixOS
local function is_nixos()
	local os_release = home_dir .. "/.nix-profile"
	local f = io.open(os_release, "r")
	if f ~= nil then
		f:close()
		return true
	end
	-- fallback: check for /etc/os-release mentioning nixos
	local f2 = io.open("/etc/os-release", "r")
	if f2 ~= nil then
		local content = f2:read("*all")
		f2:close()
		if content:find("NixOS") then
			return true
		end
	end
	return false
end

local bicep_lsp_dll, powershell_es_lsp_bin, lua_ls

if is_nixos() then
	bicep_lsp_dll = home_dir .. "/.nix-profile/lib/bicep/Bicep.LangServer.dll"
	powershell_es_lsp_bin = home_dir .. "/.nix-profile/lib/powershell-editor-services"
	lua_ls = home_dir .. "/.nix-profile/bin/lua-language-server"
else
	bicep_lsp_dll = home_dir
		.. "/.local/share/nvim/mason/packages/bicep-lsp/extension/bicepLanguageServer/Bicep.LangServer.dll"
	powershell_es_lsp_bin = home_dir .. "/.local/share/nvim/mason/packages/powershell-editor-services"
	lua_ls = home_dir .. "/.local/share/nvim/mason/bin/lua-language-server"
end

local roslynCmd = {}

-- if vim.fn.has("win32") == 1 then
-- 	roslynCmd = {
-- 		"dotnet",
-- 		"C:\\Program Files\\Roslyn\\Microsoft.CodeAnalysis.LanguageServer.dll",
-- 		"--logLevel=Information",
-- 		"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
-- 		"--stdio",
-- 	}
-- elseif vim.fn.has("unix") == 1 then
-- 	roslynCmd = {
-- 		"dotnet",
-- 		"/usr/local/lib/roslyn/lib/net9.0/Microsoft.CodeAnalysis.LanguageServer.dll",
-- 		"--logLevel=Information",
-- 		"--extensionLogDirectory=" .. vim.fs.dirname(vim.lsp.get_log_path()),
-- 		"--stdio",
-- 	}
-- end

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
	pyright = {
		settings = {
			python = {
				analysis = {
					typeCheckingMode = "basic",
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
	vimls = {},
	vuels = {},
	powershell_es = {
		bundle_path = powershell_es_lsp_bin,
		settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
	},
	-- roslyn = {
	-- 	cmd = roslynCmd,
	-- },
	tailwindcss = {},
	terraformls = {
		-- cmd = { "terraform-ls", "serve" },
		-- filetypes = { "terraform", "tf" },
		-- root_dir = require("lspconfig.util").root_pattern(".terraform", ".git", "*.tf"),
	},
	tflint = {},
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
