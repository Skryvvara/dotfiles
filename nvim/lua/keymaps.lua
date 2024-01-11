local opts = { noremap = true, silent = true }

-- leader key used as <leader> bellow
vim.g.mapleader = " "

-- open netrw (file explorer)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- redo (undo with u)
vim.keymap.set("n", "U", "<C-r>", opts)

-- move the line bellow into current line with a space in between
vim.keymap.set("n", "J", "mzJ`z", opts)

-- move half a page
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- search
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

vim.keymap.set('i', '<S-Tab>', '<C-d>', opts)

-- SPLITS --
local split_lead = "<C-w>"
vim.keymap.set("n", split_lead .. "s", ":vsplit<CR>", opts)
vim.keymap.set("n", split_lead .. "hs", ":split<CR>", opts)
vim.keymap.set("n", split_lead .. "d", ":vert diffsplit ", opts)
vim.keymap.set("n", split_lead .. "<Up>", ":wincmd k<CR>", opts)
vim.keymap.set("n", split_lead .. "<Down>", ":wincmd j<CR>", opts)
vim.keymap.set("n", split_lead .. "<Left>", ":wincmd h<CR>", opts)
vim.keymap.set("n", split_lead .. "<Right>", ":wincmd l<CR>", opts)

-- TABS --
local tab_lead = "<C-t>"
vim.keymap.set("n", tab_lead .. "t", ":tabnew<CR>", opts)
vim.keymap.set("n", tab_lead .. "s", ":tab split<CR>", opts)
vim.keymap.set("n", tab_lead .. "q", ":tabclose<CR>", opts)
vim.keymap.set("n", tab_lead .. "x", ":tabonly<CR>", opts)
vim.keymap.set("n", tab_lead .. "n", ":-tabmove<CR>", opts)
vim.keymap.set("n", tab_lead .. "m", ":+tabmove<CR>", opts)
vim.keymap.set("n", tab_lead .. "<Up>", ":tabnext<CR>", opts)
vim.keymap.set("n", tab_lead .. "<Down>", ":tablast<CR>", opts)
vim.keymap.set("n", tab_lead .. "<Left>", ":tabprev<CR>", opts)
vim.keymap.set("n", tab_lead .. "<Right>", ":tabnext<CR>", opts)
for i = 1, 9 do
    vim.keymap.set("n", tab_lead .. i, ":tabn " .. i .. "<CR>", opts)
end

-- execute yamllint
vim.keymap.set("n", "<C-l>y", "<cmd>split term://yamllint %<CR>")

-- execute the open file (e.g. script.sh)
local exe_lead = "<C-x>"
vim.keymap.set("n", exe_lead .. "m", "<cmd>!chmod +x %<CR>", opts)
vim.keymap.set("n", exe_lead .. "x", "<cmd>split term://sh % <CR>", opts)

-- Makefile bindings
local make_lead = "<C-m>"
vim.keymap.set("n", make_lead .. "m", ":make ", opts)
vim.keymap.set("n", make_lead .. "x", ":make<CR>", opts)

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

-- cut line into the 'black hole register' aka. delete line
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- cut the selected line into 'black hole register', then paste copied content
vim.keymap.set("v", "<leader>p", [["_dP]])

-- change to normal mode from insert mode with ctrl+c
vim.keymap.set("i", "<C-c>", "<Esc>", opts)

--vim.keymap.set("n", "Q", "<nop>") --untested
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz") --untested
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz") --untested

-- navigate trough location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")                                     --untested
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")                                     --untested

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) --untested

-- open git menu
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, opts)

-- source file
vim.keymap.set("n", "<leader><leader>", ":so<CR>", opts)
