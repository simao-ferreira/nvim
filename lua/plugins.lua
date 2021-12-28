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
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Plugins go here
return packer.startup(function(use)

    use 'wbthomason/packer.nvim' -- Have packer manage itself
    use {'ellisonleao/gruvbox.nvim', requires = {'rktjmp/lush.nvim'}}
    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'},
        config = [[require('config.gitsigns')]]}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = [[require('config.treesitter')]]}

    if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

