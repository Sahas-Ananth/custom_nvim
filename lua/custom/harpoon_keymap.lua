local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add current file to Harpoon." })
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu." })

vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end, { desc = "Navigate to file 1 in Harpoon." })
vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end, { desc = "Navigate to file 2 in Harpoon." })
vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end, { desc = "Navigate to file 3 in Harpoon." })
vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end, { desc = "Navigate to file 4 in Harpoon." })
