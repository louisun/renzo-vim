local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local finders = require("telescope.finders")
local pickers = require("telescope.pickers")
local previewers = require("telescope.previewers")
local conf = require("telescope.config").values
local themes = require("telescope.themes")

require "telescope".setup {
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    }
}

-- 获取配置文件完全路径
function get_vim_file_path(relative_path)
    return vim.fn.stdpath("config") .. relative_path
end

local option_path_list = {
    "/init/mapping-common.vim",
    "/init/mapping-leader.vim",
    "/init/mapping-local-leader.vim",
    "/init/mapping-space.vim"
}

local option_path_map = {}

for _, path in ipairs(option_path_list) do
    option_path_map[path] = get_vim_file_path(path)
end

view_map_viewer_picker = function(opts)
    opts = opts or {}
    -- opts = themes.get_dropdown(opts)

    pickers.new(
        opts,
        {
            prompt_title = "🌎选择 map.vim 文件",
            finder = finders.new_table(
                {
                    results = option_path_list
                }
                ),
            sorter = conf.generic_sorter(opts),
            previewer = previewers.new_buffer_previewer {
                define_preview = function(self, entry, status)
                    return require("telescope.previewers.utils").job_maker(
                        {"vim-map-viewer", "--preview", "--file", option_path_map[entry.value]},
                        self.state.bufnr,
                        {
                            callback = function(bufnr, content)
                                if content ~= nil then
                                    require("telescope.previewers.utils").regex_highlighter(bufnr, "help")
                                end
                            end
                        }
                        )
                end
            },
            attach_mappings = function(prompt_bufnr, map)
                actions.select_default:replace(
                    function()
                        local selection = action_state.get_selected_entry()
                        actions.close(prompt_bufnr)
                        vim.fn.OpenVimMapViewer(option_path_map[selection.value])
                    end
                    )
                return true
            end
        }
        ):find()
end

vim.api.nvim_set_keymap("n", "<LocalLeader>m", "<cmd>lua view_map_viewer_picker()<CR>", {noremap = true, silent = true})

