local ts_status_ok, ts = pcall(require, 'nvim-treesitter.configs')
if not ts_status_ok then
  return
end

ts.setup {
    ensure_installed = {
        'lua',
        'markdown',
        'python',
        'kotlin',
        'java',
        'json',
        'bash',
        'dockerfile',
        'css',
        'html',
        'json5',
        'make',
        'scss',
        'toml',
        'yaml',
        'regex',
        'vim'
    },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true,
        disable = { "" }
    },
    rainbow = {
    enable = true,
     disable = { "" },
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}

