local keymap = vim.keymap.set

-- ctrl q close current buffer
keymap("n", "<C-q>", ":bd<CR>", { noremap = true, silent = true })

-- ctrl hjkl move focus between splits
keymap("n", "<C-h>", "<C-w>h", { noremap = true })
keymap("n", "<C-j>", "<C-w>j", { noremap = true })
keymap("n", "<C-k>", "<C-w>k", { noremap = true })
keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- ctrl shift j jump to next window
keymap("n", "<C-J>", "<C-w>w", { noremap = true })

-- ctrl e force quit all
keymap("n", "<C-e>", ":qa!<CR>", { noremap = true })

-- ctrl c enter command mode
keymap({ "i", "v", "x", "n" }, "<C-c>", "<Esc>:")

-- ctrl n go normal mode
keymap({ "i", "v", "x", "n" }, "<C-n>", "<Esc>")
keymap("i", "jj", "<Esc>", { noremap = true, expr = false, nowait = true })
-- ctrl s save file
keymap({ "i", "v", "n" }, "<C-s>", "<Esc>:w<CR>")

-- keep selection after indenting
keymap("v", "<", "<gv", { noremap = true, silent = true })

-- o O add new line below above without cursor move
keymap("n", "o", "m`o<Esc>``", { noremap = true })
keymap("n", "O", "m`O<Esc>``", { noremap = true })

-- tt copy using xclip
keymap("n", "tt", ":w !xclip -selection clipboard<CR>", { noremap = true, silent = true })

-- tp paste from xclip
keymap("n", "tp", ":r !xclip -selection clipboard -o<CR>", { noremap = true, silent = true })

-- tc copy to termux clipboard
keymap({ "n", "v", "t" }, "tc", ":w !termux-clipboard-set<CR>", { noremap = true, silent = true })

-- tv paste from termux clipboard
keymap({ "n", "v", "t" }, "tv", ":r !termux-clipboard-get<CR>", { noremap = true, silent = true })

-- ctrl f open fzf in home dir
-- keymap("n", "<C-f>", ":FzfLua files cwd=~/ <CR>")

-- ctrl b next buffer
keymap("n", "<C-b>", ":bn<CR>", { noremap = true })

-- leader lf format using conform
keymap("n", "<leader>lf", function()
	require("conform").format({ bufnr = 0 })
end)

-- leader mh mark file with harpoon
keymap("n", "<leader>mh", function()
	require("harpoon.mark").add_file()
end)

-- leader ht toggle harpoon menu
keymap("n", "<leader>ht", function()
	require("harpoon.ui").toggle_quick_menu()
end)

-- wrap aware k j
keymap("n", "k", function()
	return vim.v.count > 0 and "k" or "gk"
end, { expr = true })

keymap("n", "j", function()
	return vim.v.count > 0 and "j" or "gj"
end, { expr = true })

-- leader gd jump to definition
keymap("n", "<leader>gd", "<C-]>", { noremap = true })

-- leader dg jump back from definition
keymap("n", "<leader>dg", "<C-t>", { noremap = true })

-- delete change without yanking
keymap("n", "ciw", '"_ciw', { noremap = true })
keymap("n", "caw", '"_caw', { noremap = true })
keymap({ "n", "x", "v" }, "dd", '"_dd', { noremap = true })
keymap("n", "<leader>P", '"0p', { desc = "Paste last yank" })
keymap({ "n", "x", "v" }, "s", '"_s', { noremap = true })
keymap({ "n", "x", "v" }, "x", '"_x', { noremap = true })
keymap("n", "d", '"_d', { noremap = true })
keymap("v", "d", '"_d', { noremap = true, silent = true, nowait = true })

-- ctrl hjkl move in insert mode
keymap("i", "<C-h>", "<Left>", { noremap = true })
keymap("i", "<C-j>", "<Down>", { noremap = true })
keymap("i", "<C-k>", "<Up>", { noremap = true })
keymap("i", "<C-l>", "<Right>", { noremap = true })

-- move lines up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- keep screen centered while moving
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- ctrl t toggle floating terminal
keymap({ "n", "t" }, "<C-t>", "<cmd>FloatingWin<CR>i")

-- toggle mark down renderer
keymap("n", "<leader>md", "<cmd>RenderMarkdown toggle<cr>")

--  set folding method to manual
keymap("n", "<leader>tf", "<cmd>set foldmethod=manual<cr> ", { noremap = true })
