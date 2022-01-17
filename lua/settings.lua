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
o.cmdheight = 2                                 -- height for displaying messages
o.mouse = 'v' 				                            -- middle-click paste
o.termguicolors = true		                            -- enable 24 bit colors
o.laststatus = 2                                        -- status line always
o.completeopt = { 'menuone', 'noselect', 'preview' }    -- cmp popup options

-- window local
o.number = true				-- numbered lines
o.relativenumber = true		-- displays current line number
o.colorcolumn = '80'		-- set a column border
o.cursorline = true         -- highlights the current line
o.conceallevel = 0          -- markdown `` is visible again

-- buffer local
o.expandtab = true			-- expand tab to spaces so that tabs are spaces
o.autoindent = true			-- indent a new line
o.smartindent = true		-- indent a new line - extra stuff
o.fileencoding = 'utf-8'

-- Spell
-- to fix error: Cannot find word list
-- run `nvim -u NORC`
-- :set spelllang=de
-- :set spelllang=pt_pt
-- It will prompt for the download of the lang files
o.spell = true                                  -- always spellcheck
o.spelllang = { 'en', 'pt_pt', 'de_de'}         -- set languages for spellcheck



cmd([[set iskeyword+=-]])   -- treats words with dash as one word
cmd('syntax on')
cmd('au TextYankPost * lua vim.highlight.on_yank{timeout=200}')

