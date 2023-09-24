-- Plugin which adds DAP support for python.

return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function(_, opts)
    local path = "/home/sahas/mambaforge/envs/stego/bin/python"
    require("dap-python").setup(path)
  end,
}
