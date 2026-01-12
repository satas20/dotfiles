-- Keymaps are automatically loaded on the VeryLazy event
local map = vim.keymap.set

-- 1. Escape Mapping
-- Exit insert mode quickly by typing 'jj'
map("i", "jj", "<Esc>", { desc = "Quick Escape" })

-- 2. Start/End Line Optimizations
-- ö and ç are physical equivalents of 0 and $ on your layout
map({ "n", "v" }, "ö", "0", { desc = "Go to Start of Line" })
map({ "n", "v" }, "ç", "$", { desc = "Go to End of Line" })

-- 3. Block Jumps (Paragraphs)
-- We map these as the primary keys for jumping between code blocks
-- Note: You can still type ğ/ü in Insert mode for your Turkish comments.
map({ "n", "o", "x" }, "ğ", "{", { desc = "Jump up paragraph" })
map({ "n", "o", "x" }, "ü", "}", { desc = "Jump down paragraph" })
-- Exit terminal mode using Esc (Note: This might interfere with some terminal TUI apps)

-- Exit terminal mode using your "jj" shortcut (Highly Recommended)
---- Exit terminal mode using your "jj" shortcut
map("t", "jj", [[<c-\><c-n>]], { desc = "exit terminal mode" })
