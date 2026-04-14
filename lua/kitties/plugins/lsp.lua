-- lua/kitties/plugins/lsp.lua
return {
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        lazy = true,
        config = false,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local lsp_zero = require("lsp-zero")

            lsp_zero.on_attach(function(_, bufnr)
                lsp_zero.default_keymaps({ buffer = bufnr })
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename,
                    { buffer = bufnr, desc = "LSP rename" })
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
                    { buffer = bufnr, desc = "Code action" })
            end)

            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "omnisharp",  -- C#
                    "clangd",     -- C++
                    "ols",        -- Odin
                    "glsl_analyzer", -- GLSL
                },
                handlers = {
                    function(server)
                        require("lspconfig")[server].setup({})
                    end,

                    -- Lua: suppress "undefined global vim" noise
                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    runtime = { version = "LuaJIT" },
                                    workspace = { checkThirdParty = false },
                                    diagnostics = { globals = { "vim" } },
                                },
                            },
                        })
                    end,

                    -- C#: point at your .sln if needed
                    omnisharp = function()
                        require("lspconfig").omnisharp.setup({
                            -- cmd = { "omnisharp" },  -- mason handles this
                            -- root_dir = ... ,  -- auto-finds .sln
                        })
                    end,
                },
            })
        end,
    },
}
