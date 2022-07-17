local config = {}

function config.zephyr()
    vim.cmd("colorscheme zephyr")
end

function config.galaxyline()
    local status_ok, galaxyline = pcall(require, "galaxyline")
    if not status_ok then
        return
    end

    local colors = require("galaxyline.theme").default
    local condition = require("galaxyline.condition")
    local gls = galaxyline.section
    galaxyline.short_line_list = { "NvimTree", "vista", "dbui", "packer" }

    gls.left[1] = {
        RainbowRed = {
            provider = function()
                return "▊ "
            end,
            highlight = { colors.blue, colors.bg },
        },
    }

    gls.left[2] = {
        ViMode = {
            provider = function()
                local mode_color = {
                    ["!"] = colors.red,
                    [""] = colors.blue,
                    [""] = colors.orange,
                    ["r?"] = colors.cyan,
                    c = colors.magenta,
                    ce = colors.red,
                    cv = colors.red,
                    i = colors.green,
                    ic = colors.yellow,
                    n = colors.red,
                    no = colors.red,
                    r = colors.cyan,
                    R = colors.violet,
                    rm = colors.cyan,
                    Rv = colors.violet,
                    s = colors.orange,
                    S = colors.orange,
                    t = colors.red,
                    v = colors.blue,
                    V = colors.blue,
                }
                vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim.fn.mode()] .. " guibg=" .. colors.bg)
                return "  "
            end,
        },
    }

    gls.left[3] = {
        FileSize = {
            condition = condition.buffer_not_empty,
            highlight = { colors.fg, colors.bg },
            provider = "FileSize",
        },
    }

    gls.left[4] = {
        FileIcon = {
            condition = condition.buffer_not_empty,
            highlight = { require("galaxyline.provider_fileinfo").get_file_icon_color, colors.bg },
            provider = "FileIcon",
        },
    }

    gls.left[5] = {
        FileName = {
            condition = condition.buffer_not_empty,
            highlight = { colors.fg, colors.bg, "bold" },
            provider = "FileName",
        },
    }

    gls.left[6] = {
        LineInfo = {
            highlight = { colors.fg, colors.bg },
            provider = "LineColumn",
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
        },
    }

    -- gls.left[7] = {
    --     PerCent = {
    --         highlight = { colors.fg, colors.bg, "bold" },
    --         provider = "LinePercent",
    --         separator = " ",
    --         separator_highlight = { "NONE", colors.bg },
    --     },
    -- }

    gls.left[7] = {
        DiagnosticError = {
            highlight = { colors.red, colors.bg },
            icon = "  ",
            provider = "DiagnosticError",
        },
    }

    gls.left[8] = {
        DiagnosticWarn = {
            highlight = { colors.yellow, colors.bg },
            icon = "  ",
            provider = "DiagnosticWarn",
        },
    }

    gls.left[9] = {
        DiagnosticHint = {
            highlight = { colors.cyan, colors.bg },
            icon = "  ",
            provider = "DiagnosticHint",
        },
    }

    gls.left[10] = {
        DiagnosticInfo = {
            highlight = { colors.blue, colors.bg },
            icon = "  ",
            provider = "DiagnosticInfo",
        },
    }

    gls.mid[1] = {
        ShowLspClient = {
            condition = function()
                local tbl = { ["dashboard"] = true, [""] = true }
                if tbl[vim.bo.filetype] then
                    return false
                end
                return true
            end,
            highlight = { colors.blue, colors.bg, "bold" },
            icon = " LSP:",
            provider = "GetLspClient",
        },
    }

    gls.right[1] = {
        FileEncode = {
            condition = condition.hide_in_width,
            highlight = { colors.green, colors.bg, "bold" },
            provider = "FileEncode",
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
        },
    }

    gls.right[2] = {
        FileFormat = {
            condition = condition.hide_in_width,
            highlight = { colors.green, colors.bg, "bold" },
            provider = "FileFormat",
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
        },
    }

    gls.right[3] = {
        GitIcon = {
            provider = function()
                return "  "
            end,
            condition = condition.check_git_workspace,
            highlight = { colors.violet, colors.bg, "bold" },
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
        },
    }

    gls.right[4] = {
        GitBranch = {
            condition = condition.check_git_workspace,
            highlight = { colors.violet, colors.bg, "bold" },
            provider = "GitBranch",
        },
    }

    gls.right[5] = {
        Separator = {
            provider = function()
                return " "
            end,
        },
    }

    gls.right[6] = {
        DiffAdd = {
            condition = condition.hide_in_width,
            highlight = { colors.green, colors.bg },
            icon = "  ",
            provider = "DiffAdd",
        },
    }

    gls.right[7] = {
        DiffModified = {
            condition = condition.hide_in_width,
            highlight = { colors.orange, colors.bg },
            icon = " 柳",
            provider = "DiffModified",
        },
    }

    gls.right[8] = {
        DiffRemove = {
            condition = condition.hide_in_width,
            highlight = { colors.red, colors.bg },
            icon = "  ",
            provider = "DiffRemove",
        },
    }

    gls.right[9] = {
        RainbowBlue = {
            provider = function()
                return " ▊"
            end,
            highlight = { colors.blue, colors.bg },
        },
    }

    gls.short_line_left[1] = {
        BufferType = {
            highlight = { colors.blue, colors.bg, "bold" },
            provider = "FileTypeName",
            separator = " ",
            separator_highlight = { "NONE", colors.bg },
        },
    }

    gls.short_line_left[2] = {
        SFileName = {
            condition = condition.buffer_not_empty,
            highlight = { colors.fg, colors.bg, "bold" },
            provider = "SFileName",
        },
    }

    gls.short_line_right[1] = {
        BufferIcon = {
            highlight = { colors.fg, colors.bg },
            provider = "BufferIcon",
        },
    }
end

function config.nvim_bufferline()
    require("bufferline").setup{
        options = {
            buffer_close_icon = "",
            always_show_bufferline = false,
        }
    }
end

function config.nvim_tree()
    require("nvim-tree").setup({
        disable_netrw = false,
        hijack_cursor = true,
        hijack_netrw = true,
    })
end

function config.telescope()
    if not packer_plugins["plenary.nvim"].loaded then
        vim.api.nvim_command("packadd plenary.nvim")
        vim.api.nvim_command("packadd popup.nvim")
        vim.api.nvim_command("packadd telescope-fzy-native.nvim")
        vim.api.nvim_command("packadd telescope-file-browser.nvim")
    end
    require("telescope").setup {
        defaults = {
            layout_config = {
                horizontal = {prompt_position = "top", results_width = 0.6},
                vertical = {mirror = false}
            },
            sorting_strategy = "ascending",
            file_previewer = require"telescope.previewers".vim_buffer_cat.new,
            grep_previewer = require"telescope.previewers".vim_buffer_vimgrep
            .new,
            qflist_previewer = require"telescope.previewers".vim_buffer_qflist
            .new
        },
        extensions = {
            fzy_native = {
                override_generic_sorter = false,
                override_file_sorter = true
            }
        }
    }
    require("telescope").load_extension("fzy_native")
end

function config.autopairs()
    require("nvim-autopairs").setup()
end

function config.comment()
    require("Comment").setup()
end

function config.hlslens()
    require("hlslens").setup({
        calm_down = true,
        nearest_only = true,
    })
end

function config.autosave()
    require("autosave").setup()
end

function config.which_key()
    require("which-key").setup()
end

function config.gitsigns()
    require("gitsigns").setup()
end

function config.nvim_treesitter()
    vim.api.nvim_command("set foldmethod=expr")
    vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
    require"nvim-treesitter.configs".setup {
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        sync_install = false,
        highlight = {
            enable = true,
        },
        textobjects = {
            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                },
            },
        },
        autotag = {
            enable = true,
        },
    }
end

function config.indent_blankline()
    require("indent_blankline").setup({
        show_current_context = true,
    })
end

function config.nvim_lsp()
    local lspconfig = require("lspconfig")
    lspconfig.sumneko_lua.setup{
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    globals = {"vim"},
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }
    lspconfig.clangd.setup{}
    lspconfig.rust_analyzer.setup{}
    lspconfig.jdtls.setup{}
    lspconfig.gopls.setup{}
    lspconfig.pyright.setup{}
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.html.setup{}
    lspconfig.jsonls.setup{
        capabilities = capabilities,
    }
    lspconfig.cssls.setup{
        capabilities = capabilities,
    }
    lspconfig.tsserver.setup{}
    lspconfig.zls.setup{}
end

function config.lspsaga()
    require("lspsaga").init_lsp_saga()
end

function config.nvim_cmp()
    local cmp = require("cmp")
    if not cmp then return end
    cmp.setup({
        preselect = cmp.PreselectMode.Item,
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        formatting = {
            fields = {"kind", "abbr", "menu"},
            format = function(entry, vim_item)
                local lspkind_icons = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = " ",
                    Field = "",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "硫",
                    Property = "",
                    Unit = " ",
                    Value = "",
                    Enum = " ",
                    Keyword = "ﱃ",
                    Snippet = " ",
                    Color = " ",
                    File = " ",
                    Reference = "Ꮢ",
                    Folder = " ",
                    EnumMember = " ",
                    Constant = " ",
                    Struct = " ",
                    Event = "",
                    Operator = "",
                    TypeParameter = " ",
                }
                local meta_type = vim_item.kind
                vim_item.kind = lspkind_icons[vim_item.kind]..""
                vim_item.menu = ({
                    buffer = " Buffer",
                    nvim_lsp = meta_type,
                    path = " Path",
                })[entry.source.name]
                return vim_item
            end,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-p>"] = cmp.mapping.select_prev_item(),
            ["<C-n>"] = cmp.mapping.select_next_item(),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<Tab>"] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        sources = cmp.config.sources({
            {name = "nvim_lsp"}, {name = "vsnip"},
            {name = "buffer"}, {name = "path"},
        }),
    })
end

return config
