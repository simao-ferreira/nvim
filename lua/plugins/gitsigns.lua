local status_ok, gs= pcall(require, "gitsigns")
if not status_ok then
  return
end

gs.setup {
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
}
