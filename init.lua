--local plugins_path = vim.fn.stdpath('config') .. "/pack"

require("hotpot").setup({
  provide_require_fennel = true,
  enable_hotpot_diagnostics = true
})

require("config")
