-- load defaults i.e lua_lsp
local configs = require("nvchad.configs.lspconfig")

local lspconfig = require("lspconfig")

local home_dir = os.getenv("HOME")
if home_dir == nil then
  home_dir = os.getenv("USERPROFILE")
end

local bicep_lsp_bin = home_dir
    .. "/.local/share/nvim/mason/packages/bicep-lsp/extension/bicepLanguageServer/Bicep.LangServer.dll"
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
        powershell_es = {
          bundle_path = powershell_es_lsp_bin,
          settings = { powershell = { codeFormatting = { Preset = "OTBS" } } },
        },
        ruff = {},
        tailwindcss = {},
        ts_ls = {},
        vimls = {},
        terraformls = {},
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
      for name, opts in pairs(servers) do
        opts.on_init = configs.on_init
        opts.on_attach = configs.on_attach
        opts.capabilities = configs.capabilities

        require("lspconfig")[name].setup(opts)
      end
    end,
  },
}
