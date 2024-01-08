local defaults = {
    tabstop = 2,
    softtabstop = 2,
    shiftwidth = 2,
}

-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.mouse = 'a'               -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = defaults["tabstop"]         -- number of visual spaces per TAB
vim.opt.softtabstop = defaults["softtabstop"] -- number of spacesin tab when editing
vim.opt.shiftwidth = defaults["shiftwidth"]   -- insert 4 spaces on a tab
vim.opt.expandtab = true                      -- tabs are spaces, mainy because of python

vim.opt.wildmode = 'longest,list,full'

-- UI config
vim.opt.number = true          -- show absolute number
vim.opt.relativenumber = false -- add numbers to each line on the left side
vim.opt.cursorline = true      -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true      -- open new vertical split bottom
vim.opt.splitright = true      -- open new horizontal splits right
vim.opt.termguicolors = true   -- enable 24-bit RGB color in the TUI
vim.opt.showmode = true        --we are experienced, we don't need the "-- INSERT --" mode hint

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searched by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.showtabline = 2

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

vim.opt.hidden = false

--vim.opt.foldmethod="syntax"
--vim.opt.foldlevel=0
--vim.opt.foldnestmax=1
--vim.opt.foldclose="all"

return defaults
