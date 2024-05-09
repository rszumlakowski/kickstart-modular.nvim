-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Make netrw way better
  'tpope/vim-vinegar',

  -- Quoting and parenthesizing made easy
  'tpope/vim-surround',

  -- Jump between errors and other places
  'tpope/vim-unimpaired',

  -- The premier Vim plugin for Git
  'tpope/vim-fugitive',

  -- Searching with ripgrep
  'jremmen/vim-ripgrep',

  -- Easy substitution of text
  {
    'gbprod/substitute.nvim',
    opts = {
      highlight_substituted_text = {
        enabled = false,
      },
    },
    config = function(_, opts)
      require('substitute').setup(opts)
      vim.keymap.set('n', 's', require('substitute').operator, { noremap = true })
      vim.keymap.set('n', 'ss', require('substitute').line, { noremap = true })
      vim.keymap.set('n', 'S', require('substitute').eol, { noremap = true })
      vim.keymap.set('x', 's', require('substitute').visual, { noremap = true })
    end,
  },

  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },

  -- TODO learn how refactoring works or find out if there is one built into Neovim or Lua
  {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('refactoring').setup()
    end,
  },
}
