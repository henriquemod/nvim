vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- PLUGINS  
  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.2',
  	requires = { {'nvim-lua/plenary.nvim'} }
  }

 use {
  'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

  use { 'rose-pine/neovim', as = 'rose-pine', run = function()
	  vim.cmd('colorscheme rose-pine')
  end,
  }

  use { 'ThePrimeagen/harpoon' }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }

  use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      run = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}

end)
