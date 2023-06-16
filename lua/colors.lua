vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("materialbones")

--vim.keymap.set("n", "<C-e>", function()
--    local result = vim.treesitter.get_captures_at_cursor(0)
--    print(vim.inspect(result))
--  end,
--  { noremap = true, silent = false })

--vim.keymap.set("n", "<F4>", function()
--  if vim.o.background == "light" then
--    vim.opt.background = "dark"
--  else
--    vim.opt.background = "light"
--  end
--end)
