-- ==================== Formateador ====================
vim.keymap.set("n", "<leader>cf", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })

-- Opcional: también en visual para formatear rangos seleccionados
vim.keymap.set("v", "<leader>cf", function()
  vim.lsp.buf.format({ async = true })
end, { noremap = true, silent = true })
