return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		-- nvim-treesitter 1.0+ uses new API
		-- Highlighting and indentation are now handled by Neovim's built-in treesitter
		require("nvim-treesitter").setup({
			-- Parser installation directory (optional)
		})

		-- Enable treesitter-based highlighting for all filetypes with installed parsers
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
			end,
		})

		-- Enable treesitter-based indentation
		vim.opt.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
}
