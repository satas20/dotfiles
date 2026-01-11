-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- -- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- 1. "jj" to Escape in Insert Mode
-- This lets you exit insert mode quickly without reaching for ESC
map("i", "jj", "<Esc>", { desc = "Quick Escape" })

-- 2. Turkish Keyboard Optimizations
-- Map "ö" to start of line (0) and "ç" to end of line ($)
-- This makes navigation much faster on TR keyboards
map("n", "ö", "0", { desc = "Go to Start of Line" })
map("n", "ç", "$", { desc = "Go to End of Line" })
map("v", "ö", "0", { desc = "Go to Start of Line" })
map("v", "ç", "$", { desc = "Go to End of Line" })

-- Optional: If you ever need to type literal ö or ç in Normal mode (rare),
-- you might want to map the original 0/$ keys to them, but usually not needed for nav.
