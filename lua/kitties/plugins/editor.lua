-- lua/kitties/plugins/editor.lua
return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = (vim.fn.has("win32") == 1)
                    and "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install"
                    or "make",
            },
        },
        config = function()
            local telescope = require("telescope")
            telescope.setup({})

            -- load fzf AFTER telescope.setup, and guard against build failure
            local ok, _ = pcall(telescope.load_extension, "fzf")
            if not ok then
                vim.notify("telescope-fzf-native not built. Run :Lazy build telescope-fzf-native.nvim", vim.log.levels.WARN)
            end

            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
            vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Git files" })
            vim.keymap.set("n", "<leader>ps", function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") })
            end, { desc = "Grep string" })
            vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Live grep" })
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "File explorer" },
        },
    },
}
