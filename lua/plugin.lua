local fn,uv,api = vim.fn,vim.loop,vim.api
local packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local compile_path = packer_path .. "/plugin/packer_compiled.lua"
local state = uv.fs_stat(packer_path)
if not state then
    local cmd = "!git clone git@github.com:wbthomason/packer.nvim " .. packer_path
    api.nvim_command(cmd)
    api.nvim_command("packadd packer.nvim")
    vim.notify("please reopen nvim and run PackerInstall PackerCompile")
end
local conf = require("config")
return require("packer").startup({
    function(use)
        use {"wbthomason/packer.nvim"}
        use {
            "glepnir/zephyr-nvim",
            config = conf.zephyr,
        }
        use {
            "glepnir/galaxyline.nvim",
            branch = "main",
            config = conf.galaxyline,
            requires = "kyazdani42/nvim-web-devicons"
        }
        use {
            "kyazdani42/nvim-tree.lua",
            cmd = "NvimTreeToggle",
            config = conf.nvim_tree,
            requires = "kyazdani42/nvim-web-devicons"
        }
        use {
            "akinsho/nvim-bufferline.lua",
            config = conf.nvim_bufferline,
            requires = "kyazdani42/nvim-web-devicons"
        }
        use {
            "nvim-telescope/telescope.nvim",
            cmd = "Telescope",
            config = conf.telescope,
            requires = {
                {"nvim-lua/popup.nvim", opt = true},
                {"nvim-lua/plenary.nvim",opt = true},
                {"nvim-telescope/telescope-fzy-native.nvim",opt = true},
            }
        }
        use {
            "windwp/nvim-autopairs",
            event = "InsertEnter",
            config = conf.autopairs,
        }
        use {
            "numToStr/Comment.nvim",
            event = "BufRead",
            config = conf.comment,
        }
        use {
            "kevinhwang91/nvim-hlslens",
            event = "BufRead",
            config = conf.hlslens,
        }
        use {
            "Pocco81/AutoSave.nvim",
            event = "InsertLeave",
            config = conf.autosave,
        }
        use {
            "folke/which-key.nvim",
            event = {"BufRead", "BufNewFile"},
            config = conf.which_key,
        }
        use {
            "lewis6991/gitsigns.nvim",
            event = {"BufRead", "BufNewFile"},
            config = conf.gitsigns,
            requires = {"nvim-lua/plenary.nvim", opt = true},
        }
        use {
            "nvim-treesitter/nvim-treesitter",
            event = {"BufRead", "BufNewFile"},
            run = ":TSUpdate",
            after = "telescope.nvim",
            config = conf.nvim_treesitter,
        }
        use {
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter"
        }
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = {"BufRead","BufNewFile"},
            config = conf.indent_blankline,
        }
        use {
            "windwp/nvim-ts-autotag",
            after = "nvim-treesitter",
        }
        use {
            "neovim/nvim-lspconfig",
            config = conf.nvim_lsp,
        }
        use {
            "glepnir/lspsaga.nvim",
            after = "nvim-lspconfig",
            config = conf.lspsaga,
        }
        use {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            config = conf.nvim_cmp,
            requires = {
                {"hrsh7th/cmp-nvim-lsp", after = "nvim-lspconfig"},
                {"hrsh7th/cmp-buffer", after = "nvim-cmp"},
                {"hrsh7th/cmp-path", after = "nvim-cmp"},
                {"hrsh7th/cmp-vsnip", after = "nvim-cmp"},
                {"hrsh7th/vim-vsnip", after = "nvim-cmp"},
            },
        }
    end,
    config = {
        compile_path = compile_path,
        git = {
            default_url_format = 'git@github.com:%s',
            clone_timeout = 120
        },
    }
})
