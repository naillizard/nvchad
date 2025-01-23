return {
	{
		"NvChad/nvim-colorizer.lua",
		opts = {
			user_default_options = {
				css = true,
				tailwind = true,
				virtualtext = "■",
			},
			filetypes = {
				"*",
				"!lazy",
			},
		},
		config = function(_, opts)
			require("colorizer").setup(opts)
		end,
	},
}
