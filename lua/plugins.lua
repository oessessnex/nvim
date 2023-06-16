local plugins_path = vim.fn.stdpath("config") .. "/pack"

require("packer").startup({function(use)
  use "wbthomason/packer.nvim"
  use "rktjmp/lush.nvim"
  use "mcchrish/zenbones.nvim"
  use "neovim/nvim-lspconfig"
  use "jubnzv/virtual-types.nvim"
  use "nvim-orgmode/orgmode"
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons"
    }
  }
  use "simnalamburt/vim-mundo"
  use "let-def/ocp-indent-vim"
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {
     "folke/trouble.nvim",
     requires = {
       "nvim-tree/nvim-web-devicons"
     },
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
  }
  use 'nvim-treesitter/playground'
end, config = {
  package_root = plugins_path,
  plugin_package = "plugins"
}})

require("orgmode").setup_ts_grammar()

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    --disable = {"ocaml"};
    additional_vim_regex_highlighting = {'org'},
  }
}

require "nvim-treesitter.configs".setup({
  playground = {
    enable = true
  }
})

require("orgmode").setup({
  org_agenda_files = {'~/Self/*'},
  org_default_notes_file = '~/Self/refile.org',
})

require("trouble").setup({
  use_diagnostic_signs = true
})

local telescope = require('telescope.builtin')
vim.keymap.set("n", "<C-p>", telescope.find_files, {})

vim.keymap.set("n", "<F7>", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})

require "plugins.file-explorer"
require "plugins.lsp"
require "plugins.mundo"
