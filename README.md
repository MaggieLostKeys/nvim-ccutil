# nvim-ccutil
A colour column setter for nvim.

## Setup

Using [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "MaggieLostKeys/nvim-ccutil",
  event = {"BufEnter", "BufAdd"},
},
```

## Config

### Default column width

To change the default column width all languages that do not have an override will use, add a `default_width` property to your `opts`. Keep in mind that the value needs to be a string:

```lua
{
  "MaggieLostKeys/nvim-ccutil",
  event = {"BufEnter", "BufAdd"},
  opts = {
    default_width = "100", -- default: 80
  }
},
```

If you want to default to no colour column, set `default_width` to `""`.

### Column offset

By default, the colour column marks the last allowed column. You can offset the column by one by simply setting the `column_marks_limit` property to `true`. The column now marks the first past-the-end column.

```lua
{
  "MaggieLostKeys/nvim-ccutil",
  event = {"BufEnter", "BufAdd"},
  opts = {
    column_marks_limit = true, -- default: false
  }
},
```

### Overriding a buffer type

If you want to set a custom column width for a specific language or buffer type, add a `type_override` table containing type-width-key pairs. To remove the colour column for a specific buffer type, set its width to `""`:

```lua
{
  "MaggieLostKeys/nvim-ccutil",
  event = {"BufEnter", "BufAdd"},
  opts = {
    type_overrides = {
      swift = "120",
      markdown = "200",
      text = "", -- no column in text files
    },
  }
},
```

This plugin provides the `CCUtilGetCurrentBufferType` command to print the current buffer type.
