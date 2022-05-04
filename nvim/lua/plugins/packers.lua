-- packer init

-- use packer mirros for packer or plugin install
local use_packer_mirrors = true

-- vim.cmd [[ packadd packer.nvim ]]
local status, packer = pcall(require, "packer")

local proxy_url = "https://github.ztzztztt.workers.dev/"
local packer_repo_prefix = "https://github.com/%s"

if use_packer_mirrors then
    packer_repo_prefix = proxy_url .. packer_repo_prefix
end


if not status then
    local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    vim.fn.delete(packer_path, "rf")
    -- git clone packer.nvim
    vim.fn.system {
        "git",
        "clone",
        string.format(packer_repo_prefix, 'wbthomason/packer.nvim'),
        "--depth", 
        "20",
        packer_path
    }

    vim.cmd [[ packadd packer.nvim ]]
    local status, packer = pcall(require, "packer")
    if status then
        print("packer init success")
    else
        error("packer init failed")
    end
end


-- packer mirror url
if use_packer_mirrors then
    packer.init {
        git = {
            default_url_format = packer_repo_prefix
        }
    }
end


return packer.startup(function()
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    -- Lsp
    use { 'neovim/nvim-lspconfig' }       -- Collection of configurations for built-in LSP client
    use { 'hrsh7th/nvim-cmp' }            -- Autocompletion plugin
    use { 'hrsh7th/cmp-nvim-lsp' }        -- LSP source for nvim-cmp
    use { 'saadparwaiz1/cmp_luasnip' }    -- Snippets source for nvim-cmp
    use { 'L3MON4D3/LuaSnip' }            -- Snippets plugin
    -- 代码片段
    use { 'rafamadriz/friendly-snippets' }

    -- indent
    use { 'lukas-reineke/indent-blankline.nvim' }

    -- autoparirs
    use { 'windwp/nvim-autopairs' }
    -- git integration
    -- use { 'lewis6991/gitsigns.nvim' }

    -- Terminal in nvim
    use { "akinsho/toggleterm.nvim" }

    -- Comment
    -- use { 'numToStr/Comment.nvim' }
    use { 'terrortylor/nvim-comment' }
    use { "danymat/neogen" }

    -- Dap
    use { 'mfussenegger/nvim-dap' }
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use { 'theHamsta/nvim-dap-virtual-text' }
    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    -- Tree
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    -- Lualine
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true} }
    -- Tabline, bufferline
    use { 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }
    -- fuzzy finder
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    -- media file preview extension for telescope
    use { 'nvim-telescope/telescope-media-files.nvim' }

    -- colorschema
    use 'NTBBloodbath/doom-one.nvim'
end)
