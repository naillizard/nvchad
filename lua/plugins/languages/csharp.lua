return {
	{
		"seblyng/roslyn.nvim",
		ft = "cs",
		---@module 'roslyn.config'
		---@type RoslynNvimConfig
		opts = {
			exe = { "Microsoft.CodeAnalysis.LanguageServer" },
		},
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		optional = true,
		opts = function()
			local dap = require("dap")
			if not dap.adapters["netcoredbg"] then
				require("dap").adapters["netcoredbg"] = {
					type = "executable",
					command = vim.fn.exepath("netcoredbg"),
					args = { "--interpreter=vscode" },
					options = {
						detached = false,
					},
				}
			end
			for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
				if not dap.configurations[lang] then
					dap.configurations[lang] = {
						{
							type = "netcoredbg",
							name = "Launch file",
							request = "launch",
							---@diagnostic disable-next-line: redundant-parameter
							program = function()
								return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/", "file")
							end,
							cwd = "${workspaceFolder}",
						},
						{
							type = "coreclr",
							name = "Attach to C# Process",
							request = "attach",
							processId = require("dap.utils").pick_process,
							cwd = "${workspaceFolder}",
						},
						-- Divider for the launch.json derived configs
						{
							name = "----- ↓ launch.json configs ↓ -----",
							type = "",
							request = "launch",
						},
					}
				end
			end
		end,
	},

	{
		"nvim-neotest/neotest",
		optional = true,
		-- lazy = true,
		-- event = 'VeryLazy',
		dependencies = {
			"Issafalcon/neotest-dotnet",
		},
		opts = {
			adapters = {
				["neotest-dotnet"] = {
					-- Here we can set options for neotest-dotnet
				},
			},
		},
	},
}
