local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- =========================
-- <leader>w  Ventanas
-- =========================
map("n", "<leader>wv", "<cmd>vsplit<cr>",          vim.tbl_extend("force", opts, { desc = "Split vertical" }))
map("n", "<leader>ws", "<cmd>split<cr>",           vim.tbl_extend("force", opts, { desc = "Split horizontal" }))
map("n", "<leader>wd", "<cmd>close<cr>",           vim.tbl_extend("force", opts, { desc = "Cerrar ventana" }))
map("n", "<leader>ww", "<C-w>w",                   vim.tbl_extend("force", opts, { desc = "Siguiente ventana" }))
map("n", "<leader>w=", "<C-w>=",                   vim.tbl_extend("force", opts, { desc = "Igualar ventanas" }))
map("n", "<leader>wh", "<C-w>h",                   vim.tbl_extend("force", opts, { desc = "Ventana izquierda" }))
map("n", "<leader>wj", "<C-w>j",                   vim.tbl_extend("force", opts, { desc = "Ventana abajo" }))
map("n", "<leader>wk", "<C-w>k",                   vim.tbl_extend("force", opts, { desc = "Ventana arriba" }))
map("n", "<leader>wl", "<C-w>l",                   vim.tbl_extend("force", opts, { desc = "Ventana derecha" }))

-- =========================
-- <leader>b  Buffers
-- =========================
map("n", "<leader>bn", "<cmd>bnext<cr>",           vim.tbl_extend("force", opts, { desc = "Siguiente buffer" }))
map("n", "<leader>bp", "<cmd>bprevious<cr>",       vim.tbl_extend("force", opts, { desc = "Buffer anterior" }))
map("n", "<leader>bd", "<cmd>bdelete<cr>",         vim.tbl_extend("force", opts, { desc = "Cerrar buffer" }))
map("n", "<leader>bk", "<cmd>bdelete!<cr>",        vim.tbl_extend("force", opts, { desc = "Matar buffer (forzado)" }))

-- ========================= 
-- Formateador 
-- ====================
map("n", "<leader>cf", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-- Opcional: también en visual para formatear rangos seleccionados
map("v", "<leader>cf", function()
  vim.lsp.buf.format({ async = true })
end, opts)
