-- settings.lua

local o = vim.opt
local cmd = vim.cmd

-- global options
o.smartcase = true
o.ignorecase = true
o.incsearch = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.scrolloff = 6                                 -- minimum lines to keep arround cursor when scrolling
o.clipboard = 'unnamedplus'		                -- copy to system clipboard - uses xclip
o.backspace = { 'indent' , 'eol' , 'start' }	-- use backspace to delete i,o,s

o.mouse = 'v' 				-- middle-click paste
o.termguicolors = true		-- enable 24 bit colors
o.laststatus = 2            -- status line always

-- window local
o.number = true				-- numbered lines
o.relativenumber = true		-- displays current line number
o.colorcolumn = '80'		-- set a column border
o.cursorline = true         -- highlights the current line

-- buffer local
o.expandtab = true			-- expand tab to spaces so that tabs are spaces
o.autoindent = true			-- indent a new line
o.smartindent = true		-- indent a new line - extra stuff

cmd('syntax on')
cmd('au TextYankPost * lua vim.highlight.on_yank{timeout=200}')

