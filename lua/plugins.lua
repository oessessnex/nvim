local plugins_path = vim.fn.stdpath('config') .. "/pack"

require 'packer'.startup({function(use)
  use "norcalli/nvim-colorizer.lua"
end, config = {
  package_root = plugins_path,
  plugin_package = "plugins"
}})
