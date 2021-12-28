require('nvim-treesitter.configs').setup {
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
    }
}
