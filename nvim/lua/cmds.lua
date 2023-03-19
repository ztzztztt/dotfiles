local autocmd = vim.api.nvim_create_autocmd
local usercmd = vim.api.nvim_create_user_command


-- exit neovim cursor cannot restore
autocmd({ "VimLeave" }, {
    pattern = { "*" },
    callback = function()
        vim.cmd [[ set guicursor= | call chansend(v:stderr, "\x1b[ q") ]]
    end
})

-- autosave, when leave insert mode or file changed in normal mode,
-- the content in buffer will be saved to file
autocmd({ "InsertLeave", "TextChanged" }, {
    pattern = { "*" },
    command = "silent! wall",
    nested = true
})

-- restore cursor pos when open buffer
autocmd({ "BufReadPost" }, {
    pattern = { "*" },
    callback = function()
        if vim.fn.line("'\'") > 0 and vim.fn.line("'\'") < vim.fn.line("$") then
            vim.fn.setpos(".", vim.fn.getpos("'\'"))
            vim.cmd("silent! foldopen")
        end
    end
})

local snippet_root = "~/.config/nvim/snippet/"

usercmd(
    "OpenUserSnippetFile",
    function(ctx)
        local snippet_file_name = vim.bo.filetype .. ".json"
        local snippet_file_path = snippet_root .. snippet_file_name
        vim.cmd(":e %s"):format(snippet_file_path)
    end,
    {
        desc = "Open user snippet file from current filetype"
    }
)

usercmd(
    "OpenUserSnippetPackage", 
    function(ctx) 
        local snippet_file_name = "package.json"
        local snippet_file_path = snippet_root .. snippet_file_name
        vim.cmd(":e %s"):format(snippet_file_path)
    end, 
    { 
        desc = "Open user snippet package.json file"
    }
)
