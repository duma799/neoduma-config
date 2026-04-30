local function read_last_theme()
    local f = io.open(vim.fn.expand("~/.config/wezterm/current_theme.txt"), "r")
    if f then
        local name = f:read("*l")
        f:close()
        if name and name ~= "" then
            return name
        end
    end
    return "nightfox"
end

local last_theme = read_last_theme()

return {

    {
        "ellisonleao/gruvbox.nvim",
        lazy = last_theme ~= "gruvbox",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                contrast = "hard",
                overrides = {
                    SignColumn = { bg = "none" },
                    GruvboxGreenSign = { bg = "none" },
                    GruvboxOrangeSign = { bg = "none" },
                    GruvboxPurpleSign = { bg = "none" },
                    GruvboxYellowSign = { bg = "none" },
                    GruvboxRedSign = { bg = "none" },
                    GruvboxBlueSign = { bg = "none" },
                    GruvboxAquaSign = { bg = "none" },
                },
            })
            if last_theme == "gruvbox" then
                vim.cmd.colorscheme("gruvbox")
            end
        end,
    },

    {
        "folke/tokyonight.nvim",
        lazy = last_theme ~= "tokyonight",
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                transparent = false,
                terminal_colors = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = {},
                    variables = {},
                },
            })
            if last_theme == "tokyonight" then
                vim.cmd.colorscheme("tokyonight")
            end
        end,
    },

    {
        dir = vim.fn.expand("~/Downloads/token-main"),
        name = "token",
        lazy = last_theme ~= "token",
        priority = 1000,
        config = function()
            if last_theme == "token" then
                vim.o.background = "dark"
                vim.cmd.colorscheme("token")
            end
        end,
    },

    {
        "EdenEast/nightfox.nvim",
        lazy = last_theme ~= "nightfox",
        priority = 1000,
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = false,
                    terminal_colors = true,
                    styles = {
                        comments = "italic",
                        keywords = "italic",
                    },
                },
            })
            if last_theme == "nightfox" then
                vim.cmd.colorscheme("nightfox")
            end
        end,
    },
}
