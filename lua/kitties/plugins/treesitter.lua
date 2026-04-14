-- lua/kitties/plugins/treesitter.lua
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "c", "cpp", "c_sharp", "lua", "odin", "glsl",
                "vim", "vimdoc", "query", "json", "yaml", "markdown",
            },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false, -- typo fixed
            },
        })
    end,
}
