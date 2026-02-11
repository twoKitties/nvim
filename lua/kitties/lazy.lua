local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)
local plugins = {
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate",
		dependencies = {"nvim-lua/plenary.nvim"}
	},
	{"nvim-telescope/telescope.nvim", branch = "0.1.x",
		dependencies = {"nvim-lua/plenary.nvim"}
	},
	{"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
	callback = function()
		require('telescope').load_extension('fzf')
	end,
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{"rose-pine/neovim", name = "rose-pine"},
	config = function()
	vim.cmd("colorscheme rose-pine")
	end,
    {"nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
}
}
require("lazy").setup(plugins, opt)

