-- Utilities for creating configurations
local util = require("formatter.util")

-- NOTE: Need to install prettierd globally for these to work
-- > npm install -g @fsouza/prettierd
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.INFO,
	filetype = {
		javascript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettierd,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettierd,
		},
		css = {
			require("formatter.filetypes.css").prettierd,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettierd,
		},
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--edition 2021" },
					stdin = true,
				}
			end,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		toml = {
			require("formatter.filetypes.toml").taplo,
		},
		python = {
			require("formatter.filetypes.python").black,
		},
		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},
		graphql = {
			require("formatter.filetypes.graphql").prettierd,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettierd,
		},
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.cmd([[ augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END ]])
