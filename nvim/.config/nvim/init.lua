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

-- Let the terminal's own background show through instead of the colorscheme's
-- painted one. Re-applied on every ColorScheme so it survives scheme changes.
local function clear_backgrounds()
	for _, group in ipairs({
		"Normal",
		"NormalNC",
		"NormalFloat",
		"FloatBorder",
		"SignColumn",
		"LineNr",
		"EndOfBuffer",
		"MsgArea",
	}) do
		local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
		hl.bg = nil
		hl.ctermbg = nil
		vim.api.nvim_set_hl(0, group, hl)
	end
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = clear_backgrounds })
clear_backgrounds()
