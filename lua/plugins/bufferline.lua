local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

bufferline.setup {
  options = {
    numbers = "none",
    indicator_icon = "▎",
    modified_icon = "●",
    left_trunc_marker = "",
    right_trunc_marker = "",
    max_name_length = 30,
    max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
    tab_size = 20,
    diagnostics = false,
    diagnostics_update_in_insert = false,
    offsets = {{ filetype = "NvimTree", text = "File Explorer", padding = 1 }},
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = "thick",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
  }
}
