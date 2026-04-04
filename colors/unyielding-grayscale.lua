-- Unyielding Grayscale - A pure grayscale colorscheme
-- Deepest charcoal background with strategic brightness for emphasis

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "unyielding-grayscale"
vim.o.background = "dark"
vim.o.termguicolors = true

-- Color Palette
local colors = {
	-- Backgrounds
	bg = "#121212", -- Deepest charcoal
	bg_light = "#1a1a1a", -- Slightly lighter
	bg_lighter = "#222222", -- Section headers
	bg_selection = "#333333", -- Selection
	bg_inactive = "#2a2a2a", -- Inactive elements
	bg_hover = "#252525", -- Hover states

	-- Foregrounds
	fg = "#d4d4d4", -- Off-white, default text
	fg_bright = "#ffffff", -- Pure white for emphasis
	fg_light = "#e0e0e0", -- Bright off-white
	fg_medium = "#cccccc", -- Standard light gray
	fg_dim = "#bbbbbb", -- Slightly dimmed
	fg_muted = "#aaaaaa", -- Mid-gray
	fg_dark = "#888888", -- Darker gray
	fg_darker = "#666666", -- Dark gray for comments
	fg_darkest = "#555555", -- Darkest for line numbers

	-- UI Elements
	border = "#444444",
	border_focus = "#666666",
	cursor = "#ffffff",

	none = "NONE",
}

-- Helper function to set highlights
local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Editor UI
hl("Normal", { fg = colors.fg, bg = colors.bg })
hl("NormalFloat", { fg = colors.fg, bg = colors.bg_light })
hl("NormalNC", { fg = colors.fg, bg = colors.bg })
hl("Cursor", { fg = colors.bg, bg = colors.cursor })
hl("CursorLine", { bg = "#1e1e1e" })
hl("CursorLineNr", { fg = colors.fg_bright, bold = true })
hl("LineNr", { fg = colors.fg_darkest })
hl("SignColumn", { fg = colors.fg_darker, bg = colors.bg })
hl("ColorColumn", { bg = colors.bg_light })
hl("VertSplit", { fg = colors.border })
hl("WinSeparator", { fg = colors.border })
hl("Folded", { fg = colors.fg_darker, bg = colors.bg_light })
hl("FoldColumn", { fg = colors.fg_darker, bg = colors.bg })

-- Selection and Search
hl("Visual", { bg = colors.bg_selection })
hl("VisualNOS", { bg = colors.bg_selection })
hl("Search", { fg = colors.bg, bg = colors.fg_medium })
hl("IncSearch", { fg = colors.bg, bg = colors.fg_bright })
hl("CurSearch", { fg = colors.bg, bg = colors.fg_bright })

-- Status Line
hl("StatusLine", { fg = colors.fg_medium, bg = colors.bg_light })
hl("StatusLineNC", { fg = colors.fg_darker, bg = colors.bg_light })
hl("WildMenu", { fg = colors.bg, bg = colors.fg_medium })
hl("ModeMsg", { fg = colors.fg_medium, bold = true })
hl("MoreMsg", { fg = colors.fg_medium, bold = true })

-- Tab Line
hl("TabLine", { fg = colors.fg_darker, bg = colors.bg_light })
hl("TabLineFill", { bg = colors.bg_light })
hl("TabLineSel", { fg = colors.fg, bg = colors.bg })

-- Popup Menu
hl("Pmenu", { fg = colors.fg, bg = colors.bg_hover })
hl("PmenuSel", { fg = colors.fg, bg = colors.bg_selection })
hl("PmenuSbar", { bg = colors.bg_light })
hl("PmenuThumb", { bg = colors.fg_darker })

-- Floating Windows
hl("FloatBorder", { fg = colors.border, bg = colors.bg_light })
hl("FloatTitle", { fg = colors.fg_bright, bg = colors.bg_light, bold = true })

-- Messages and Errors
hl("ErrorMsg", { fg = colors.fg_medium, bold = true })
hl("WarningMsg", { fg = colors.fg_muted, bold = true })
hl("Question", { fg = colors.fg_dim })
hl("Title", { fg = colors.fg_bright, bold = true })

-- Diff
hl("DiffAdd", { bg = colors.bg_lighter })
hl("DiffChange", { bg = colors.bg_inactive })
hl("DiffDelete", { fg = colors.fg_darker, bg = colors.bg_light })
hl("DiffText", { bg = colors.bg_selection })

-- Spell
hl("SpellBad", { undercurl = true, sp = colors.fg_medium })
hl("SpellCap", { undercurl = true, sp = colors.fg_dim })
hl("SpellLocal", { undercurl = true, sp = colors.fg_muted })
hl("SpellRare", { undercurl = true, sp = colors.fg_muted })

-- Syntax Highlighting

-- Comments
hl("Comment", { fg = colors.fg_darker, italic = true })

-- Constants
hl("Constant", { fg = colors.fg_bright, bold = true })
hl("String", { fg = colors.fg_muted })
hl("Character", { fg = colors.fg_muted })
hl("Number", { fg = colors.fg_bright })
hl("Boolean", { fg = colors.fg_bright, bold = true })
hl("Float", { fg = colors.fg_bright })

-- Identifiers
hl("Identifier", { fg = colors.fg_medium })
hl("Function", { fg = colors.fg_light, bold = true })

-- Statements
hl("Statement", { fg = colors.fg_bright, bold = true })
hl("Conditional", { fg = colors.fg_bright, bold = true })
hl("Repeat", { fg = colors.fg_bright, bold = true })
hl("Label", { fg = colors.fg_bright, bold = true })
hl("Operator", { fg = colors.fg_dim })
hl("Keyword", { fg = colors.fg_bright, bold = true })
hl("Exception", { fg = colors.fg_bright, bold = true })

-- PreProc
hl("PreProc", { fg = colors.fg_medium })
hl("Include", { fg = colors.fg_bright, bold = true })
hl("Define", { fg = colors.fg_bright, bold = true })
hl("Macro", { fg = colors.fg_medium })
hl("PreCondit", { fg = colors.fg_bright, bold = true })

-- Types
hl("Type", { fg = colors.fg_light, bold = true })
hl("StorageClass", { fg = colors.fg_bright, bold = true })
hl("Structure", { fg = colors.fg_light, bold = true })
hl("Typedef", { fg = colors.fg_light, bold = true })

-- Special
hl("Special", { fg = colors.fg_medium })
hl("SpecialChar", { fg = colors.fg_muted })
hl("Tag", { fg = colors.fg_light })
hl("Delimiter", { fg = colors.fg_dim })
hl("SpecialComment", { fg = colors.fg_darker, italic = true })
hl("Debug", { fg = colors.fg_medium })

-- Misc
hl("Underlined", { fg = colors.fg_dim, underline = true })
hl("Ignore", { fg = colors.fg_darker })
hl("Error", { fg = colors.fg_medium, bold = true })
hl("Todo", { fg = colors.fg_bright, bold = true })

-- Treesitter Highlights
hl("@variable", { fg = colors.fg_medium })
hl("@variable.builtin", { fg = colors.fg_bright, bold = true })
hl("@variable.parameter", { fg = colors.fg_dim, italic = true })
hl("@variable.member", { fg = colors.fg_medium })

hl("@constant", { fg = colors.fg_bright, bold = true })
hl("@constant.builtin", { fg = colors.fg_bright, bold = true })
hl("@constant.macro", { fg = colors.fg_medium })

hl("@string", { fg = colors.fg_muted })
hl("@string.escape", { fg = colors.fg_dark })
hl("@string.special", { fg = colors.fg_muted })
hl("@character", { fg = colors.fg_muted })
hl("@number", { fg = colors.fg_bright })
hl("@boolean", { fg = colors.fg_bright, bold = true })
hl("@float", { fg = colors.fg_bright })

hl("@function", { fg = colors.fg_light, bold = true })
hl("@function.builtin", { fg = colors.fg_light, bold = true })
hl("@function.macro", { fg = colors.fg_light, bold = true })
hl("@function.method", { fg = colors.fg_light, bold = true })

hl("@keyword", { fg = colors.fg_bright, bold = true })
hl("@keyword.function", { fg = colors.fg_bright, bold = true })
hl("@keyword.operator", { fg = colors.fg_bright, bold = true })
hl("@keyword.return", { fg = colors.fg_bright, bold = true })

hl("@conditional", { fg = colors.fg_bright, bold = true })
hl("@repeat", { fg = colors.fg_bright, bold = true })
hl("@label", { fg = colors.fg_bright, bold = true })
hl("@operator", { fg = colors.fg_dim })
hl("@exception", { fg = colors.fg_bright, bold = true })

hl("@type", { fg = colors.fg_light, bold = true })
hl("@type.builtin", { fg = colors.fg_light, bold = true })
hl("@type.definition", { fg = colors.fg_light, bold = true })

hl("@constructor", { fg = colors.fg_light, bold = true })
hl("@namespace", { fg = colors.fg_light })
hl("@include", { fg = colors.fg_bright, bold = true })

hl("@property", { fg = colors.fg_medium })
hl("@attribute", { fg = colors.fg_medium })
hl("@field", { fg = colors.fg_medium })

hl("@comment", { fg = colors.fg_darker, italic = true })
hl("@comment.documentation", { fg = colors.fg_darker, italic = true })

hl("@punctuation.bracket", { fg = colors.fg_dim })
hl("@punctuation.delimiter", { fg = colors.fg_dim })
hl("@punctuation.special", { fg = colors.fg_dark })

hl("@tag", { fg = colors.fg_light })
hl("@tag.attribute", { fg = colors.fg_medium })
hl("@tag.delimiter", { fg = colors.fg_dark })

-- LSP Semantic Tokens
hl("@lsp.type.class", { fg = colors.fg_light, bold = true })
hl("@lsp.type.decorator", { fg = colors.fg_medium })
hl("@lsp.type.enum", { fg = colors.fg_light, bold = true })
hl("@lsp.type.enumMember", { fg = colors.fg_bright, bold = true })
hl("@lsp.type.function", { fg = colors.fg_light, bold = true })
hl("@lsp.type.interface", { fg = colors.fg_light, bold = true })
hl("@lsp.type.macro", { fg = colors.fg_medium })
hl("@lsp.type.method", { fg = colors.fg_light, bold = true })
hl("@lsp.type.namespace", { fg = colors.fg_light })
hl("@lsp.type.parameter", { fg = colors.fg_dim, italic = true })
hl("@lsp.type.property", { fg = colors.fg_medium })
hl("@lsp.type.struct", { fg = colors.fg_light, bold = true })
hl("@lsp.type.type", { fg = colors.fg_light, bold = true })
hl("@lsp.type.typeParameter", { fg = colors.fg_light, bold = true })
hl("@lsp.type.variable", { fg = colors.fg_medium })

-- Diagnostic
hl("DiagnosticError", { fg = colors.fg_medium })
hl("DiagnosticWarn", { fg = colors.fg_muted })
hl("DiagnosticInfo", { fg = colors.fg_dim })
hl("DiagnosticHint", { fg = colors.fg_dark })
hl("DiagnosticUnderlineError", { undercurl = true, sp = colors.fg_medium })
hl("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.fg_muted })
hl("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.fg_dim })
hl("DiagnosticUnderlineHint", { undercurl = true, sp = colors.fg_dark })

-- Git Signs
hl("GitSignsAdd", { fg = colors.fg_dim })
hl("GitSignsChange", { fg = colors.fg_muted })
hl("GitSignsDelete", { fg = colors.fg_darker })

-- Telescope
hl("TelescopeBorder", { fg = colors.border, bg = colors.bg_light })
hl("TelescopePromptBorder", { fg = colors.border, bg = colors.bg_light })
hl("TelescopeResultsBorder", { fg = colors.border, bg = colors.bg_light })
hl("TelescopePreviewBorder", { fg = colors.border, bg = colors.bg_light })
hl("TelescopeSelection", { fg = colors.fg, bg = colors.bg_selection })
hl("TelescopeSelectionCaret", { fg = colors.fg_bright })
hl("TelescopeMatching", { fg = colors.fg_bright, bold = true })

-- NeoTree / File Explorer
hl("NeoTreeNormal", { fg = colors.fg, bg = colors.bg_light })
hl("NeoTreeNormalNC", { fg = colors.fg, bg = colors.bg_light })
hl("NeoTreeDirectoryName", { fg = colors.fg_medium })
hl("NeoTreeDirectoryIcon", { fg = colors.fg_medium })
hl("NeoTreeFileName", { fg = colors.fg })
hl("NeoTreeFileIcon", { fg = colors.fg_medium })
hl("NeoTreeGitModified", { fg = colors.fg_muted })
hl("NeoTreeGitAdded", { fg = colors.fg_dim })
hl("NeoTreeGitDeleted", { fg = colors.fg_darker })

-- Which Key
hl("WhichKey", { fg = colors.fg_bright, bold = true })
hl("WhichKeyGroup", { fg = colors.fg_medium })
hl("WhichKeyDesc", { fg = colors.fg })
hl("WhichKeySeparator", { fg = colors.fg_dark })
hl("WhichKeyFloat", { bg = colors.bg_light })
hl("WhichKeyBorder", { fg = colors.border, bg = colors.bg_light })

-- Indent Blankline
hl("IndentBlanklineChar", { fg = colors.bg_lighter })
hl("IndentBlanklineContextChar", { fg = colors.border })

-- Noice
hl("NoicePopup", { fg = colors.fg, bg = colors.bg_light })
hl("NoiceCmdlinePopup", { fg = colors.fg, bg = colors.bg_light })
hl("NoiceCmdlinePopupBorder", { fg = colors.border, bg = colors.bg_light })

-- Mason
hl("MasonNormal", { fg = colors.fg, bg = colors.bg_light })
hl("MasonHeader", { fg = colors.fg_bright, bg = colors.bg_selection, bold = true })
hl("MasonHighlight", { fg = colors.fg_bright })
hl("MasonHighlightBlock", { fg = colors.fg_bright, bg = colors.bg_selection })

-- Notify
hl("NotifyBackground", { bg = colors.bg })
hl("NotifyERRORBorder", { fg = colors.border })
hl("NotifyWARNBorder", { fg = colors.border })
hl("NotifyINFOBorder", { fg = colors.border })
hl("NotifyDEBUGBorder", { fg = colors.border })
hl("NotifyTRACEBorder", { fg = colors.border })

-- Dashboard / Alpha
hl("DashboardHeader", { fg = colors.fg_bright })
hl("DashboardCenter", { fg = colors.fg_medium })
hl("DashboardFooter", { fg = colors.fg_darker, italic = true })
