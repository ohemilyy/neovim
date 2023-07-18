-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
use("wbthomason/packer.nvim")
use {
  "nvim-lua/plenary.nvim"
}
use("navarasu/onedark.nvim")

-- file explorer
use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "MunifTanjim/nui.nvim",
    },
  }
  
-- syntax highlighter
use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
        ts_update()
    end
}
-- illuminate similar words
use ("RRethy/vim-illuminate")
-- completion
use ("hrsh7th/nvim-cmp")
use ("hrsh7th/cmp-buffer")
use ("hrsh7th/cmp-path")
use ("hrsh7th/cmp-nvim-lsp")
use ("williamboman/mason-lspconfig.nvim")
-- Completion Snippets 
use ("L3MON4D3/LuaSnip")
use ("saadparwaiz1/cmp_luasnip")
use ("rafamadriz/friendly-snippets")
-- vs-code like icons
use("nvim-tree/nvim-web-devicons")
-- startup screen
use {
    "goolord/alpha-nvim"
  }
  
use ("MaximilianLloyd/ascii.nvim")
-- statusline
use("nvim-lualine/lualine.nvim")
-- GitStatus
use ("lewis6991/gitsigns.nvim")
-- Discord RPC
use ("andweeb/presence.nvim")
-- ToDo Comments
use ("folke/todo-comments.nvim")
-- Trouble
use ("folke/trouble.nvim")  
-- LSP Colors
use ("folke/lsp-colors.nvim")
-- Search
use ("nvim-telescope/telescope.nvim")
-- Fix Cursor
use("antoinemadec/FixCursorHold.nvim")
-- Notify
use ("rcarriga/nvim-notify")
-- TopBar
use ("romgrk/barbar.nvim")
-- rust
use ("simrat39/rust-tools.nvim")
-- Colorizer
use("norcalli/nvim-colorizer.lua")
-- Neofev
use("folke/neodev.nvim")
-- NullLS
use("jose-elias-alvarez/null-ls.nvim")
-- NLSP Settings
use("tamago324/nlsp-settings.nvim")
-- LSPKind
use("onsails/lspkind.nvim")
-- LSP Config
use("neovim/nvim-lspconfig")
-- LSP Installer
use("williamboman/nvim-lsp-installer")

 if packer_bootstrap then
    require("packer").sync()
  end
end)
