local opt = { noremap = true, silent = true }

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    previewers = {
      builtin = {
        -- both are broken in nvim 0.12.0
        render_markdown = { enabled = false },
        treesitter = { enabled = false },
      },
    },
  },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>",                            mode = "n", unpack(opt) },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>",                        mode = "n", unpack(opt) },
    { "<leader>fr", "<cmd>FzfLua combine pickers=buffers;oldfiles<cr>", mode = "n", unpack(opt) },
    { "<leader>f/", "<cmd>FzfLua grep_curbuf<cr>",                      mode = "n", unpack(opt) },
  },
}
