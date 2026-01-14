return {
  -- 1. Configure Copilot Chat (Space + a + i)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = {
      -- Unmap default keys so they don't conflict
      { "<leader>aa", false },
      { "<leader>ac", false },

      -- Set custom key: Space + a + i
      {
        "<leader>ai",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Copilot Chat",
        mode = { "n", "v" },
      },
    },
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = true },
      mappings = {
        -- Fix: Unmap 'reset' so Ctrl+l works for window navigation
        reset = {
          normal = "",
          insert = "",
        },
      },
    },
  },

  -- 2. Configure Claude / Avante (Space + a + c)
  {
    "yetone/avante.nvim",
    keys = {
      -- Unmap Avante defaults
      { "<leader>aa", false },

      -- Set custom key: Space + a + c
      {
        "<leader>ac",
        function()
          require("avante.api").toggle()
        end,
        desc = "Claude Chat (Avante)",
        mode = { "n", "v" },
      },
    },
  },

  -- 3. Organize the Menu Labels
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "AI Assistant", icon = "🤖" },
      },
    },
  },
}
