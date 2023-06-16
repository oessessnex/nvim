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
opt.backspace = {"indent" , "eol" , "start"}
opt.scrolloff = 1

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

opt.completeopt = {"menu"}

api.nvim_create_autocmd("FileType", {
  pattern = "org",
  callback = function()
    opt_local.foldlevel = 99
  end
})

api.nvim_create_autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end
})

api.nvim_create_autocmd("BufRead", {
  callback = function(opts)
    vim.api.nvim_create_autocmd("BufWinEnter", {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
          not (ft:match("commit") and ft:match("rebase"))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
            vim.api.nvim_feedkeys('g`"', "nx", false)
        end
      end
    })
  end
})
