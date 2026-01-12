return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      mappings = {
        -- Unmap the "reset" command so Ctrl-l works for navigation
        reset = {
          normal = "",
          insert = "",
        },
      },
    },
  },
}
