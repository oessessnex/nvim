local opt = vim.opt

opt.expandtab = true
opt.shiftwidth = 2
opt.softtabstop = -1
opt.tabstop = 4

opt.linebreak = true
opt.breakindent = true
opt.showbreak = "↳ "

opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. "/undodir"

opt.splitkeep = "screen"

opt.list = true

opt.foldenable = true
opt.foldcolumn = "1"

opt.signcolumn = "yes:1"

opt.mouse = "a"

opt.updatetime = 250

