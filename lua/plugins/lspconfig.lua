-- load defaults i.e lua_lsp
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities
local configs = require("nvchad.configs.lspconfig")

local home_dir = os.getenv("HOME")
if home_dir == nil then
  home_dir = os.getenv("USERPROFILE")
end

local bicep_lsp_bin = home_dir
    .. "/.local/share/nvim/mason/packages/bicep-lsp/extension/bicepLanguageServer/Bicep.LangServer.dll"
local powershell_es_lsp_bin = home_dir .. "/.local/share/nvim/mason/packages/powershell-editor-services"

local my_attach = function(client)
  on_attach(client)
  local map = vim.keymap.set
  map("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Lsp References" })
  map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Lsp Definitions" })
  map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Lsp Implementations" })
  map("n", "gx", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Lsp Diagnostics" })
  map("n", "lx", "<cmd>Telescope diagnostics<cr>", { desc = "Lsp Diagnostics" })
  map("n", "lr", function()
    require("nvchad_ui.renamer").open()
  end, { desc = "Lsp Rename" })
  map("n", "lf", function()
    vim.lsp.buf.format { async = true }
  end, { desc = "Lsp Format" })
  map("n", "la", vim.lsp.buf.code_action, { desc = "Lsp Code action" })
  map("n", "[d", function()
    vim.diagnostic.goto_prev()
    vim.diagnostic.open_float()
  end, { desc = "Prev lsp Diagnostics" })
  map("n", "]d", function()
    vim.diagnostic.goto_next()
    vim.diagnostic.open_float()
  end, { desc = "Next lsp Diagnostics" })
end

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
        vuels = {},
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
        local base_config = {
          on_attach = my_attach,
          on_init = on_init,
          capabilities = capabilities,
        }
        -- local merged = vim.tbl_deep_extend("force", base_config, configs[name])
        opts.on_init = configs.on_init
        opts.on_attach = base_config.on_attach
        opts.capabilities = configs.capabilities

        require("lspconfig")[name].setup(opts)
      end
    end,
  },
}
