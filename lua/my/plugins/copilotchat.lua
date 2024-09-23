-- This is the official guide (don't use docs in github.io): https://github.com/CopilotC-Nvim/CopilotChat.nvim

-- TODOs:
-- Make the copilot chat window size persist. You can use edgy.nvim, ask ChatGTP about it.
--
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    build = "make tiktoken",
    opts = {
      show_help = "yes", -- Show help text for CopilotChatInPlace, default: yes
      debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
      disable_extra_info = 'no', -- Disable extra information (e.g: system prompt) in the response.
      auto_follow_cursor = false,
      window = {
        layout = 'float',
        relative = 'cursor',
        width = 1,
        height = 0.4,
        title = 'Copilot Chat'
      }
    },
    event = "VeryLazy",
    keys = {
      { "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "[CopilotChat] Explain code" },
      { "<leader>ccT", "<cmd>CopilotChatTests<cr>", desc = "[CopilotChat] Generate tests" },
      {
        "<leader>co",
        "<cmd>CopilotChatToggle<cr>",
        desc = "[CopilotChat] Toggle chat window",
      },
      {
        "<leader>ccf",
        "<cmd>CopilotChatFixDiagnostic<cr>", -- Get a fix for the diagnostic message under the cursor.
        desc = "[CopilotChat] Fix diagnostic",
      },
      {
        "<leader>ccr",
        "<cmd>CopilotChatReset<cr>", -- Reset chat history and clear buffer.
        desc = "[CopilotChat] Reset chat history and clear buffer",
      }
      -- TODO: add capability to have different chat histories.
    },
  },
}
