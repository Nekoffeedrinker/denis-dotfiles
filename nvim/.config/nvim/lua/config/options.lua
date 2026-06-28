vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false

vim.diagnostic.config({
	virtual_text = true
})

vim.cmd.colorscheme "catppuccin"

-- Usar espacios en lugar de tabs
vim.o.tabstop = 4       -- ancho del <Tab> 
vim.o.softtabstop = 2   -- inderción/retroceso con Tab/Backspace
vim.o.shiftwidth = 4    -- sangrías automáticas (>> <<, autoident)
vim.o.expandtab = true  -- convierte tabs en espacios


-- Tabs cortas para archivos nix
local augroup = vim.api.nvim_create_augroup("NixTabs", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = "nix",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})
