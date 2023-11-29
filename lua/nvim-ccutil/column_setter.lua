local M = {}

---Sets vim's colour column.
---@param width (string): The width of the column
local function set_column(width)
  vim.opt.colorcolumn = width
end

---Sets the colourcolumn for the current buffer using the given config.
---@param config (table): The plugin's config
function M.update_colour_column(config)
  local filetype = vim.bo.filetype
  local override = config.type_overrides[filetype]

  if override == nil then
    override = config.default_width
  end

  if override ~= "" and config.column_marks_limit then
      override = tostring(tonumber(override) + 1)
  end

  set_column(override)
end

return M
