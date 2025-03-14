vim.opt.relativenumber = true
vim.opt.number = true
vim.cmd("syntax on")

vim.o.tabstop = 2 -- Set tab width to 2 spaces
vim.o.shiftwidth = 2 -- Set indentation width to 2 spaces
vim.o.expandtab = false -- Use tabs instead of spaces

-- Set .svelte files to use HTML syntax highlighting
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = "*.svelte",
    command = "set filetype=html"
})
