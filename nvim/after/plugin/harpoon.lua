local mark = require('harpoon.mark')
local ui = require('harpoon.ui')
local leader = "<C-h>"

vim.keymap.set("n", leader.."a", mark.add_file)
vim.keymap.set("n", leader.."r", mark.rm_file)
vim.keymap.set("n", leader.."q", mark.clear_all)
vim.keymap.set("n", leader.."e", ui.toggle_quick_menu)
vim.keymap.set("n", leader.."<Left>", function() ui.nav_prev() end)
vim.keymap.set("n", leader.."<Right>", function() ui.nav_next() end)
for i = 0, 9, 1 do
    vim.keymap.set("n", leader..i, function() ui.nav_file(i) end)
end

