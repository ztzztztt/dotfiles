-- indent
require('indent_blankline').setup({
    char = '┊',
    buftype_exclude = { 'terminal' }
})

-- Terminal in neovim
require('toggleterm').setup{
    -- size can be a number or function which is passed the current terminal
    size = 15,
    open_mapping = [[<C-t>]],
    hide_numbers = true,            -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '2',    -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
    start_in_insert = true,
    insert_mappings = true,         -- whether or not the open mapping applies in insert mode
    persist_size = true,
    direction = 'horizontal',
    close_on_exit = true,           -- close the terminal window when the process exits
    shell = vim.o.shell,            -- change the default shell
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        border = 'single',
        height = 80,
        winblend = 3,
    }
}

-- Treesitter
require("nvim-treesitter.install").prefer_git = true
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://github.ztzztztt.workers.dev/https://github.com/")
end
require('nvim-treesitter.configs').setup {
    -- One of "all", "maintained" (parsers with maintainers), or a list of languages
    -- ensure_installed = "maintained",
    ensure_installed = {
        "python", "yaml", "bash", "html", "json"
    },
    -- Install languages synchronously (only applied to `ensure_installed`)
    sync_install = false,
    -- List of parsers to ignore installing
    ignore_install = { "javascript", "c", "rust", "go" },
    highlight = {
        -- `false` will disable the whole extension
        enable = true,
        -- list of language that will be disabled
        disable = { "c", "rust" },
        additional_vim_regex_highlighting = false,
    },
}



-- Treesitter Fold
vim.wo.fillchars    = "fold: "
vim.wo.foldmethod   = "expr"
vim.wo.foldexpr     = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel    = 99


-- Comment
require('nvim_comment').setup({
    -- Linters prefer comment and line to have a space in between markers
    marker_padding = true,
    -- should comment out empty or whitespace only lines
    comment_empty = true,
    -- Should key mappings be created
    create_mappings = true,
    -- Normal mode mapping left hand side
    line_mapping = "<C-n>",
    -- Visual/Operator mapping left hand side
    operator_mapping = "<C-n>",
    -- Hook function to call before commenting takes place
    hook = nil
})

-- 调试工具包
local dap = require('dap')
dap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            if vim.fn.executable("python") == 1 then
                return 'python'
            elseif vim.fn.executable("/usr/bin/python") == 1 then
                return '/usr/bin/python'
            else
                local executable = vim.fn.system {
                    "python",
                    "-c",
                    "import sys; print(sys.executable)"
                }
                return executable
            end
        end;
    },
}
require("dapui").setup({
    sidebar = {
        size = 40
    }
})

-- 调试的时候在右侧显示变量的值 
require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = true,    -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,          I      -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
} 


