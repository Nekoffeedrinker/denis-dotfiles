return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable('nixd')
		-- Se añaden en forma de lista
		-- enable('nixd', 'emacs', ...)
	end
}

