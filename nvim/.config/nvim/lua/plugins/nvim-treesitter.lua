return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  build = ':TSUpdate',
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
		  "lua", "vim", "vimdoc", "yaml", "bash", "zsh", "desktop", "kitty",
		  "git_config", "git_rebase", "gitignore", "gitcommit", "diff",
		  "html", "markdown", "latex", "bibtex", "typst",
		  "arduino"
		  -- Pendiente org, emacs-lisp
	  },
    })
  end,
}
