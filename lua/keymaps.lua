-- Keymaps configuration

local keymap = vim.keymap

-- Better window navigation
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows with arrows
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Stay in indent mode
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move text up and down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Better paste (don't yank replaced text)
keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })

-- Delete to void register
keymap.set("n", "<leader>d", '"_d', { desc = "Delete to void register" })
keymap.set("v", "<leader>d", '"_d', { desc = "Delete to void register" })

-- Clear search highlighting
keymap.set("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlighting" })

-- Better save and quit
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })

-- Split windows
keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- Theme backgrounds for terminal sync
local theme_bg = {
	nightfox = "#192330",
	tokyonight = "#1a1b26",
	gruvbox = "#1d2021",
}

-- Sync nvim colorscheme to WezTerm and Ghostty
local function set_theme(nvim_scheme, theme_name)
	vim.cmd.colorscheme(nvim_scheme)
	-- Save last theme for nvim startup
	local f = io.open(vim.fn.expand("~/.config/wezterm/current_theme.txt"), "w")
	if f then
		f:write(theme_name .. "\n")
		f:close()
	end
	-- Update Ghostty background color
	local bg = theme_bg[theme_name]
	if bg then
		local ghostty_path = vim.fn.expand("~/.config/ghostty/config")
		local gf = io.open(ghostty_path, "r")
		if gf then
			local content = gf:read("*all")
			gf:close()
			content = content:gsub("background = #%x+", "background = " .. bg)
			local wf = io.open(ghostty_path, "w")
			if wf then
				wf:write(content)
				wf:close()
			end
		end
	end
end

-- Colorscheme switching (syncs nvim + WezTerm + Ghostty)
keymap.set("n", "<leader>cg", function() set_theme("gruvbox", "gruvbox") end, { desc = "Theme: Gruvbox" })
keymap.set("n", "<leader>ct", function() set_theme("tokyonight", "tokyonight") end, { desc = "Theme: Tokyo Night" })
keymap.set("n", "<leader>cn", function() set_theme("nightfox", "nightfox") end, { desc = "Theme: Nightfox" })
keymap.set("n", "<leader>cb", function()
	local colors = require("custom-colors")
	colors.transparent = not colors.transparent
	colors.apply()
	if not colors.transparent then
		vim.cmd.colorscheme(vim.g.colors_name)
	end
	print("Transparency: " .. (colors.transparent and "ON" or "OFF"))
end, { desc = "Toggle transparent background" })

-- Code execution
-- Run entire file
keymap.set("n", "<leader>rr", function()
	local filetype = vim.bo.filetype
	if filetype == "python" then
		vim.cmd("w")
		vim.cmd("split | terminal python3 %")
	elseif filetype == "javascript" then
		vim.cmd("w")
		vim.cmd("split | terminal node %")
	elseif filetype == "lua" then
		vim.cmd("w")
		vim.cmd("luafile %")
	elseif filetype == "sh" then
		vim.cmd("w")
		vim.cmd("split | terminal bash %")
	else
		print("No run command configured for filetype: " .. filetype)
	end
end, { desc = "Run current file" })

-- Run selected code (visual mode)
keymap.set("v", "<leader>rs", function()
	local filetype = vim.bo.filetype
	if filetype == "python" then
		vim.cmd("'<,'>w !python3")
	elseif filetype == "javascript" then
		vim.cmd("'<,'>w !node")
	elseif filetype == "sh" then
		vim.cmd("'<,'>w !bash")
	else
		print("No run command configured for filetype: " .. filetype)
	end
end, { desc = "Run selected code" })

-- Run current line
keymap.set("n", "<leader>rl", function()
	local filetype = vim.bo.filetype
	if filetype == "python" then
		vim.cmd(".w !python3")
	elseif filetype == "javascript" then
		vim.cmd(".w !node")
	else
		print("No run command configured for filetype: " .. filetype)
	end
end, { desc = "Run current line" })

-- Open Python REPL
keymap.set("n", "<leader>rp", ":split | terminal python3<CR>i", { desc = "Open Python REPL" })

-- Terminal navigation and closing
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("t", "<C-q>", "<C-\\><C-n>:q<CR>", { desc = "Close terminal quickly" })
keymap.set("n", "<leader>tc", ":%bd! | e# | bd#<CR>", { desc = "Close all terminals" })
