local present, telescope = pcall(require, "telescope")
if not present then
    return
end
local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")

local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                -- maybe we want to write something to the buffer here
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                end)
            end
        end
    }):sync()
end

-- require('telescope').extensions.packer.plugins(opts)
telescope.setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",

        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        theme = "dropdown",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
                results_width = 0.80,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        pickers = {
            find_files = {
                theme = "dropdown",
                find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
                mappings = {
                    n = {
                        ["cd"] = function(prompt_bufnr)
                            local selection = require("telescope.actions.state").get_selected_entry()
                            local dir = vim.fn.fnamemodify(selection.path, ":p:h")
                            require("telescope.actions").close(prompt_bufnr)
                            -- Depending on what you want put `cd`, `lcd`, `tcd`
                            vim.cmd(string.format("silent lcd %s", dir))
                        end
                    }
                }

            },
        },
        file_sorter = require("telescope.sorters").get_fzy_file,
        file_ignore_patterns = {},
        generic_sorter = require("telescope.sorters").get_generic_fzy_sorter,
        path_display = { "absolute" },
        winblend = 10,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = new_maker,
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-p>"] = action_layout.toggle_preview,
                ["<C-s>"] = actions.cycle_previewers_next,
                ["<C-a>"] = actions.cycle_previewers_prev,
            },
            n = {
                ["<C-p>"] = action_layout.toggle_preview

            }
        }

    },
    extensions = {
        file_browser = {
            theme = "ivy",
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                    -- your custom normal mode mappings
                },
            },
        },
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        },
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = { "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
            find_cmd = "rg", -- find command (defaults to `fd`)
        },
    },
})

local extensions = { "themes", "terms", "fzf" }
local packer_repos = [["extensions", "telescope-fzf-native.nvim"]]

if vim.fn.executable("ueberzug") == 1 then
    table.insert(extensions, "media_files")
    packer_repos = packer_repos .. ', "telescope-media-files.nvim"'
end

pcall(function()
    for _, ext in ipairs(extensions) do
        telescope.load_extension(ext)
    end
end)
require("telescope").load_extension("media_files")
require("telescope").load_extension("fzf")
