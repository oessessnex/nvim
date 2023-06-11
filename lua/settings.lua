local opt = vim.opt
local opt_local = vim.opt_local
local api = vim.api
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- core
opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = -1
opt.tabstop = 4

opt.linebreak = true
opt.breakindent = true
opt.showbreak = "> "

opt.mouse = "a"

opt.signcolumn = "yes:1"

opt.timeout = false
opt.ttimeout = false

opt.updatetime = 250

opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. "/undodir"

-- splits
opt.laststatus = 3
opt.splitkeep = "screen"

-- list
opt.list = true

-- folds
opt.foldenable = true
opt.foldcolumn = "1"
opt.foldlevel = 99

api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    opt_local.foldlevel = 99
  end
})

api.nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end
})
