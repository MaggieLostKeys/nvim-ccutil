local M = {}
local config = {}

local default = {
  default_width = "80",
  column_marks_limit = false,
  type_overrides = {
    NvimTree = "",
    nvdash = "",
    terminal = "",
    Trouble = "",
    mason = "",
    lazy = "",
    help = "",
  },
}

function M.setup(opts)
  config = vim.tbl_deep_extend("force", default, opts)
  vim.api.nvim_create_autocmd({"BufEnter", "BufAdd"}, {
    callback = function()
      require("nvim-ccutil.column_setter").update_colour_column(config)
    end
  })
  vim.api.nvim_create_user_command("CCUtilGetCurrentBufferType", "lua print(vim.bo.filetype)", {})
end

return M
