vim.opt.guicursor = ""
vim.opt.mouse = ""
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.smartcase = true
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.shell = "/bin/bash"
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.pumheight = 5
vim.opt.confirm = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- vim.opt.autochdir = true
vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.fillchars = { eob = "☢" }
