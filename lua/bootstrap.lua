local fn = vim.fn

-- Bootstrap packer installation
local install_suffix = '/site/pack/packer/start/packer.nvim'
local install_path = fn.stdpath 'data' .. install_suffix

if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    }
  print 'Packer is installing' -- might need to close and re-open vim
  vim.cmd('packadd packer.nvim')
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost bootstrap.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = require('packer.util').float
  }
}

-- Plugins go here
return packer.startup(function(use)
    -- Implemets cache for all loaded lua modules, allowing for preload,
    -- enabling configuration of lua modules to be found when plugins are loaded
    -- Might be included in neovim sometime soon(ish)
    use 'lewis6991/impatient.nvim'

    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use {'ellisonleao/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
    use 'windwp/nvim-autopairs'
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}
    use 'numToStr/Comment.nvim'

    -- Extras: nvim-tree, bufferline, lualine
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use 'akinsho/bufferline.nvim'
    use 'nvim-lualine/lualine.nvim'

    -- treesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use 'p00f/nvim-ts-rainbow'

    -- Completion engine
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp'

    -- Snippets
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    -- lsp
    use {'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer'}

    -- markdown
    -- requires glow to be installed
    use {'ellisonleao/glow.nvim'}

    if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

