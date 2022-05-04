-- Neovim Shortcuts
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Neovim General shortcuts
map('i', 'kk', "<Esc>", opts)
map('v', 'kk', "<Esc>", opts)
-- 清除搜索高亮
map('n', '<leader>c', ':nohl<CR>', opts)

-- 快速保存，退出
map('n', '<C-s>', ':w!<CR>', opts)
map('i', '<C-s>', '<Esc>:w!<CR>i', opts)
map('n', '<C-q>', ':q!<CR>', opts)
map('i', '<C-q>', '<Esc>:q!<CR>', opts)
-- 编辑器常用快捷键，重复当前行，剪切，复制，粘贴
map('i', '<C-d>', '<Esc>yyp<CR>^i', opts)
map('i', '<C-x>', '<Esc>dd<CR>^i', opts)
map('i', '<C-y>', '<Esc>yy<CR>^i', opts)
map('i', '<C-p>', '<Esc>p<CR>^i', opts)
map('i', '<C-a>', '<Home>', opts)
map('i', '<C-e>', '<End>', opts)
map('i', '<C-z>', '<C-G>u<C-U>', opts)
-- 阅读模式下，一次跳转9行
map('n', '<C-u>', '9k', opts)
map('n', '<C-d>', '9j', opts)
-- visual模式下选中后可以快速缩进
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- 分屏功能
map("n", "sv", ":vsp<CR>", opts)
map("n", "sh", ":sp<CR>", opts)
map("n", "sc", "<C-w>c", opts)
map("n", "so", "<C-w>o", opts) -- close others
-- 分屏切换
map('n', '<A-h>', '<C-w>h', opts)
map('n', '<A-j>', '<C-w>j', opts)
map('n', '<A-k>', '<C-w>k', opts)
map('n', '<A-l>', '<C-w>l', opts)
-- 比例控制（不常用，因为支持鼠标拖拽）
map("n", "s>", ":vertical resize +20<CR>", opts)
map("n", "s<", ":vertical resize -20<CR>", opts)
map("n", "s=", "<C-w>", opts)
map("n", "sj", ":resize +10<CR>", opts)
map("n", "sk", ":resize -10<CR>", opts)


-- Plugin Keymap
-- open terminal
map('n', '<C-t>', ':Term<CR>', { noremap = true })

-- packer shortcut
map('n', '<leader>ps', ':PackerSync<CR>', { noremap = true })

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Telescope
map('n', '<leader>sf', '<CMD>lua require("telescope.builtin").find_files()<CR>', opts)
map('n', '<leader>sg', '<CMD>lua require("telescope.builtin").live_grep()<CR>', opts)
map('n', '<leader>sb', '<CMD>lua require("telescope.builtin").buffers()<CR>', opts)
map('n', '<leader>sh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', opts)

-- bufferline 左右Tab切换
map("n", "<C-Left>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<C-Right>", ":BufferLineCycleNext<CR>", opts)
map("n", "<C-w>", ":bd<CR>", opts)

-- dap
map('n', '<F5>', '<CMD>lua require"dap".continue()<CR>', opts)
map('n', '<F7>', '<CMD>lua require"dap".step_into()<CR>', opts)
map('n', '<F8>', '<CMD>lua require"dap".step_over()<CR>', opts)
map('n', '<S-F8>', '<CMD>lua require"dap".step_out()<CR>', opts)
map('n', '<F9>', '<CMD>lua require"dap".close()<CR>', opts)
map('n', '<leader>db', '<CMD>lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<leader>dc', '<CMD>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
map('n', '<leader>dr', '<CMD>lua require"dapui".toggle()<CR>', opts)

-- neogen
map("n", "<leader>nf", "<CMD>lua require('neogen').generate({ type = 'func' })<CR>", opts)
map("n", "<leader>nc", "<CMD>lua require('neogen').generate({ type = 'class' })<CR>", opts)