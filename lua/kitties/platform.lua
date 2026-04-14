local M = {}
M.is_windows = vim.fn.has("win32") == 1
M.is_wsl = vim.fn.has("wsl") == 1
M.is_linux = vim.fn.has("unix") == 1
M.is_mac = vim.fn.has("macunix") == 1

