local keymap = vim.keymap
require("nvim-tree").setup()

local api = require("nvim-tree.api")

keymap.set("n", "<F5>", api.tree.toggle)

