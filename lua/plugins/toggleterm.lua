local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
    open_mapping = [[<c-t>]],
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	direction = "tab",
	close_on_exit = true,
	shell = vim.o.shell,
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<ESC>', '<cmd>close<cr>', opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- local Terminal = require("toggleterm.terminal").Terminal
--
-- local python = Terminal:new({ cmd = "python", hidden = true })
--
-- function _PYTHON_TOGGLE()
-- 	python:toggle()
-- end
