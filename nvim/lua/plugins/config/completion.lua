-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- lsp 
local lspconfig = require('lspconfig')
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'pyright' }

for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require('luasnip')
luasnip.config.set_config {
    history = true,
    updateevents = 'TextChanged, TextChangedI'
}
local luasnips = {
    path = {
        vim.fn.stdpath("data") .. "/site/pack/packer/start/friendly-snippets",
        vim.fn.stdpath("config") .. "/snippet"
    }
}
-- require("luasnip/loaders/from_vscode").lazy_load { paths={ "~/.local/share/nvim/site/pack/packer/start/friendly-snippets", "~/.config/nvim/snippet" } }
require("luasnip.loaders.from_vscode").lazy_load { paths=luasnips.path }


-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        ['<Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end,
        ['<S-Tab>'] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
    }, 
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    },
}

-- 括号的快速补齐
require('nvim-autopairs').setup({
    fast_wrap = {},
})

-- docstring
require('neogen').setup({
    enabled = true,
    input_after_comment = false,
    languages = {
        python = {
            template = {
                annotation_convention = "restructure",
                restructure = {
                    { nil, '""" $1 """', { no_results = true, type = { "class", "func" } } },
                    { nil, '"""$1', { no_results = true, type = { "file" } } },
                    { nil, "", { no_results = true, type = { "file" } } },
                    { nil, "$1", { no_results = true, type = { "file" } } },
                    { nil, '"""', { no_results = true, type = { "file" } } },
                    { nil, "", { no_results = true, type = { "file" } } },

                    { nil, "# $1", { no_results = true, type = { "type" } } },
                    -- custom
                    { nil, '"""$1', },
                    { "parameters", ":param %s: $1", { before_first_item = { "" }, type = { "func" } } },
                    { "attributes", "%s: $1", { before_first_item = { "" } } },
                    { "return_statement", ":return: $1", {
                        -- before_first_item = { "" },
                        type = { "func" }
                    }},
                    { nil, '"""' },
                }
            }
        }
    }
})