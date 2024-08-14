vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)
vim.keymap.set("n", "q:", "<nop>")
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set('n', '<leader>x', '<Cmd>bd<CR>', { desc = "Close buffer"})
vim.keymap.set("n", "<leader>q", ":q<CR>", { silent = true })

-- Bind to leader c switching to the directory of the oppened file
vim.keymap.set("n", "<leader>c", ":cd %:h<CR>:pwd<CR>")
vim.keymap.set("n", "<leader>lc", "@:")
-- When highlight mode you can use J or K to move the selection up and down
--
vim.keymap.set("i", "<A-l>", "<Right>")
vim.keymap.set("i", "<A-h>", "<Left>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Format code according to LSP
-- vim.keymap.set("n", "j", "gj")
-- vim.keymap.set("n", "k", "gk")

-- In normal mode, works the same way as J but keeps the cursor where it was
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "jj", "<Esc>")

vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "q", "<NOP>")
vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>mx", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<C-s>", "<cmd>:w<CR>")
vim.keymap.set("n", "<leader>rls", "<cmd>:LspRestart<CR>", { desc = "Restart LSP"})

vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })


vim.keymap.set("n", "<leader>gt", "<cmd>!go test -v -race ./...<CR>")
vim.keymap.set("n", "<leader>gr", "<cmd>!go run .<CR>")
