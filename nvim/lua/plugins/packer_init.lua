local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd("packadd packer.nvim")
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("not found packer")
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
    git = {
        clone_timeout = 300, -- Timeout, in seconds, for git clones
    },
})

-- Install your plugins here
return packer.startup(function(use)
    use({
        {
            "wbthomason/packer.nvim",
        },
        {
            "lewis6991/impatient.nvim",
            opt = true,
        },
        {
            "nvim-lua/plenary.nvim",
        },
    })

    -- 文件树
    use({
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTreeToggle",
        config = function()
            require("plugins.nvim_tree")
        end,
    })

    -- 注释
    use({
        "numToStr/Comment.nvim",
        --event = "BufRead",
        --after = "nvim-treesitter",
        after = "nvim-ts-context-commentstring",
        config = function()
            require("plugins.comment")
        end,
    })
    use({
        -- config in treesitter
        "JoosepAlviste/nvim-ts-context-commentstring",
        --event = "BufRead",
        after = "nvim-treesitter",
    })

    use({
        "kyazdani42/nvim-web-devicons",
    })

    -- buffer栏
    use({
        "akinsho/bufferline.nvim",
        event = "BufRead",
        config = function()
            require("plugins.bufferline")
        end,
    })

    use({
        "moll/vim-bbye",
        cmd = "Bdelete",
    })
    use({
        "nvim-lualine/lualine.nvim",
        event = "BufRead",
        config = function()
            require("plugins.lualine")
        end,
    })

    use({
        "akinsho/toggleterm.nvim",
        event = "BufRead",
        config = function()
            require("plugins.toggleterm")
        end,
    })

    use({
        "ahmedkhalf/project.nvim",
        event = "BufRead",
        config = function()
            require("plugins.project")
        end,
    })

    use({
        "folke/noice.nvim",
        event = "BufRead",
        config = function()
            require("plugins.noice")
        end,
        requires = {
            "MunifTanjim/nui.nvim",
        },
    })

    use({
        "lukas-reineke/indent-blankline.nvim",
        event = "BufRead",
        config = function()
            require("plugins.indentline")
        end,
    })

    use({
        "goolord/alpha-nvim",
        config = function()
            require("plugins.alpha")
        end,
    })

    -- Colorschemes
    use({ "glepnir/zephyr-nvim" })
    use({ "folke/tokyonight.nvim", disable = false, event = "InsertEnter" })
    use({ "olimorris/onedarkpro.nvim", disable = false, event = "InsertEnter" })
    use({ "tanvirtin/monokai.nvim", disable = false })
    use({ "ellisonleao/gruvbox.nvim", disable = false, event = "InsertEnter" })
    use({ "Mofiqul/dracula.nvim", disable = false, event = "InsertEnter" })
    use({ "rebelot/kanagawa.nvim", disable = false, event = "InsertEnter" })
    use({ "marko-cerovac/material.nvim", disable = false, event = "InsertEnter" })
    use({ "catppuccin/nvim", as = "catppuccin", event = "BufRead" })

    --snippet engine
    use({ "rafamadriz/friendly-snippets", event = "InsertEnter" }) -- a bunch of snippets to use
    -- cmp plugins
    use({
        "hrsh7th/nvim-cmp",
        after = "friendly-snippets",
        config = function()
            require("plugins.nvim_cmp")
        end,
    }) -- The completion plugin
    -- use({ "hrsh7th/cmp-nvim-lsp", event = "BufRead" })
    use({ "hrsh7th/cmp-nvim-lsp" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" }) -- buffer completions
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" }) -- path completions
    use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
    use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" }) -- snippet completions

    -- 括号匹配
    use({
        "windwp/nvim-autopairs",
        -- event = "InsertEnter",
        after = "nvim-cmp",
        config = function()
            require("plugins.autopairs")
        end,
    })

    -- snippets
    use({
        "L3MON4D3/LuaSnip",
        event = "BufRead",
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            -- relative to the directory of $MYVIMRC
            require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })
        end,
    })

    -- LSP
    use({
        {
            "williamboman/mason.nvim",
            -- cmd = {'Mason', 'MasonInstall'},
            -- event = "BufRead",
            -- cmd = {'Mason', 'MasonInstall'},
            config = function()
                require("mason").setup()
            end,
        },
        {
            "williamboman/mason-lspconfig.nvim",
            -- after = 'mason',
            -- event = "BufRead",
            -- cmd = {'Mason', 'MasonInstall'},
            config = function()
                require("mason-lspconfig").setup({
                    ensure_installed = require("lsp.utils").servers,
                    automatic_installation = true,
                })
            end,
        },
        {
            "neovim/nvim-lspconfig",
            after = "nvim-cmp",
            event = { "BufRead", "BufNewFile", "InsertEnter" },
            -- after = "cmp-nvim-lsp",
            -- 		cmd = "NvimTreeToggle",
            -- event = "BufRead",
            -- cmd = {'Mason', 'MasonInstall'},
            config = function()
                require("lsp.lspconfig")
            end,
        },
    })

    -- use({'mhartington/formatter.nvim', event = "BufRead", config = function() require('plugins.formatter') end})
    use({
        "jose-elias-alvarez/null-ls.nvim",
        -- after = "nvim-cmp",
        event = "BufRead",
        -- opt = true,
        config = function()
            require("plugins.null_ls")
        end,
    })
    -- for formatters and linters

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = function()
            require("plugins.telescope")
        end,
    })

    -- Treesitter
    use({
        {
            "nvim-treesitter/nvim-treesitter",
            run = function()
                local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                ts_update()
            end,
            -- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSEnable", "TSDisable", "TSModuleInfo" },
            -- event = "BufRead",
            event = "BufRead",
            config = function()
                require("plugins.treesitter")
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter-context",
            after = "nvim-treesitter",
            config = function()
                require("treesitter-context").setup()
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter",
        },
    })
    use({
        "p00f/nvim-ts-rainbow",
        after = "nvim-treesitter",
        --event = "BufRead",
    })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",

        event = "BufRead",
        config = function()
            require("gitsigns").setup()
        end,
    })

    -- 快速移动,esaymotion
    use({
        "phaazon/hop.nvim",
        event = "BufRead",
        branch = "v2", -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
        end,
    })

    -- UI 增强
    use({
        "onsails/lspkind-nvim",
        event = "BufRead",
    })
    use({
        "glepnir/lspsaga.nvim",
        event = "BufRead",
        config = function()
            require("plugins.lspsaga")
        end,
    })

    use({
        "rcarriga/nvim-notify",
        event = "BufRead",
        config = function()
            require("plugins.nvim_notify")
        end,
    })
    -- other
    use({
        "dstein64/vim-startuptime",
        cmd = "StartupTime",
    })

    use({
        "norcalli/nvim-colorizer.lua",
        event = "BufRead",
        config = function()
            require("colorizer").setup()
        end,
    })
    -- 函数签名
    use({
        "ray-x/lsp_signature.nvim",
        -- event = "InsertEnter",
        opt = true,
        config = function()
            require("plugins.lsp_signature")
        end,
    })

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "BufRead",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
    })

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
