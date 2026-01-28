return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    "folke/snacks.nvim", -- Required for the UI
  },
  -- Lazy load the plugin only when these keys are pressed
  keys = {
    -- 1. Ask AI with Context
    {
      "<leader>oa",
      function()
        require("opencode").ask("@this: ", { submit = true })
      end,
      desc = "OpenCode: Ask (Context)",
      mode = { "n", "v" },
    },
    -- 2. Menu / Actions
    {
      "<leader>om",
      function()
        require("opencode").select()
      end,
      desc = "OpenCode: Menu / Actions",
      mode = { "n", "v" },
    },
    -- 3. Toggle Window
    {
      "<leader>oo",
      function()
        require("opencode").toggle()
      end,
      desc = "OpenCode: Toggle Window",
      mode = { "n", "t" }, -- Works in normal and terminal mode
    },
    -- 4. Operators (go / goo)
    {
      "go",
      function()
        return require("opencode").operator("@this ")
      end,
      desc = "OpenCode: Add Range (Operator)",
      expr = true,
      mode = { "n", "x" },
    },
    {
      "goo",
      function()
        return require("opencode").operator("@this ") .. "_"
      end,
      desc = "OpenCode: Add Line",
      expr = true,
      mode = "n",
    },
    -- 5. SCROLLING FIX (Ctrl+u / Ctrl+d)
    {
      "<c-u>",
      function()
        require("opencode").command("session.half.page.up")
      end,
      desc = "OpenCode: Scroll Up",
      mode = { "t" }, -- Works in Terminal (Insert)
    },
    {
      "<c-d>",
      function()
        require("opencode").command("session.half.page.down")
      end,
      desc = "OpenCode: Scroll Down",
      mode = { "t" },
    },
  },
  config = function()
    -- Set global options here
    vim.g.opencode_opts = {
      -- Example: model = "claude-3-5-sonnet",
    }

    -- Essential: Enable autoread so Neovim sees changes made by OpenCode
    vim.o.autoread = true
  end,
}
