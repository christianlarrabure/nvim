local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- Plugin management
  use "wbthomason/packer.nvim" -- Have packer manage itsd
  
  -- Lua Development
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim"
  use "christianchiarulli/lua-dev.nvim"
  
  -- Editing Support
  use "windwp/nvim-autopairs"

  -- File Explorer
  use "kyazdani42/nvim-tree.lua"

  -- Tabline
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}
  
  -- Statusline
  use "christianchiarulli/lualine.nvim"

  -- Icon
  use "kyazdani42/nvim-web-devicons"

  -- Terminal
  use "akinsho/toggleterm.nvim"

  -- Utility
  use "moll/vim-bbye"
  use "lewis6991/impatient.nvim"

  -- Startup
  use "goolord/alpha-nvim"

  -- Colorschemes
  use "lunarvim/onedarker.nvim"
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"

  -- THE Completion Plugin
  use "christianchiarulli/nvim-cmp"
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- Snippet
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"
  use "RRethy/vim-illuminate"

  -- Fuzzy Finder/Telescope
  use "nvim-telescope/telescope.nvim"

  -- Syntax/Treesitter
  use "nvim-treesitter/nvim-treesitter"
  use "windwp/nvim-ts-autotag"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- Debugging
  use "mfussenegger/nvim-dap"
  use "rcarriga/nvim-dap-ui"

  -- Rust
  use("simrat39/rust-tools.nvim")

  -- Copilot
  use("github/copilot.vim")

end)
