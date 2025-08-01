-- -----------------Better nav with flash.nvim -----------------
return {
	"folke/flash.nvim",
	opts = {},
	keys = {
		-- Flash Jump (default)
		{
			"fs",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash Jump",
		},

		-- Flash Treesitter (functions, loops, etc.)
		{
			"fS",
			mode = { "n", "o", "x" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},

		-- Flash Remote (jump across windows)
		{
			"fr",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},

		-- Flash Treesitter Search
		{
			"<leader>S",
			function()
				require("flash").treesitter_search()
			end,
			desc = "Flash Treesitter Search",
		},
	},
}
