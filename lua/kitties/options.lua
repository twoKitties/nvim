vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.wo.number = true
vim.opt.clipboard = "unnamedplus"
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    undeline = true
})
