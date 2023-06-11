local plugins_path = vim.fn.stdpath("config") .. "/pack"

require("packer").startup({function(use)
  use "wbthomason/packer.nvim"
  use "rktjmp/lush.nvim"
  use "mcchrish/zenbones.nvim"
  use "rmehri01/onenord.nvim"
  use "neovim/nvim-lspconfig"
  use "nvim-orgmode/orgmode"
  use "nvim-tree/nvim-tree.lua"
  use "nvim-tree/nvim-web-devicons"
  use {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
  }
end, config = {
  package_root = plugins_path,
  plugin_package = "plugins"
}})

require("orgmode").setup_ts_grammar()

require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'},
  }
}

require("orgmode").setup({
  org_agenda_files = {'~/Self/*'},
  org_default_notes_file = '~/Self/refile.org',
})

require "plugins.file-explorer"
require "plugins.lsp"
