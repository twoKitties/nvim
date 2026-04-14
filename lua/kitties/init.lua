-- lua/kitties/init.lua
-- leader, must be before lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 250
vim.opt.undofile = true

-- diagnostics
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
})

-- keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

-- shader filetypes
vim.filetype.add({
    extension = {
        hlsl = "hlsl", hlsli = "hlsl",
        glsl = "glsl", vert = "glsl", frag = "glsl",
        comp = "glsl", geom = "glsl", tesc = "glsl", tese = "glsl",
        odin = "odin"
    },
})

-- plugins
require("kitties.lazy")
