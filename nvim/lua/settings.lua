-- Neovim common settings

-- General Settings
vim.g.mapleader     = ' '			-- change leader key to space
vim.o.mouse 	   	= 'a'			-- enable mouse support
-- vim.o.chipboard	    = 'unnameplus'	-- use system clipboard
vim.o.swapfile		= false			-- don't use swapfile

-- Neovim UI
vim.o.showmatch     = true			-- highlight matching parenthesis
vim.o.splitright    = true          -- split to the right vsplit
vim.o.splitbelow    = true          -- split to the bottom split

-- Tab, indent
vim.o.tabstop       = 4             -- replace tab with 4 space
vim.o.shiftwidth    = 4             -- auto align with 4 space
vim.o.expandtab     = true          -- replace tab with space
vim.o.smartindent   = true          -- increase/reduce the indent where appropriate

vim.o.hidden        = true          -- enable background buffers
vim.wo.number       = true          -- show line number
vim.wo.cursorline   = true          -- highlight current line
vim.wo.wrap         = false         -- display lone text in one line
vim.wo.signcolumn   = "yes"         -- 
vim.o.termguicolors = true          -- enable 24-bit RGB colors
vim.o.writebackup   = false
vim.o.completeopt   = "menu,menuone,noselect"           -- insert mode completion options


-- fold
-- vim.o.fillchars     = "fold: "
vim.wo.foldmethod   = "expr"
vim.wo.foldlevel    = 99
vim.wo.foldexpr     = "nvim_treesitter#foldexpr()"

