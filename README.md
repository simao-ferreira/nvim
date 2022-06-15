# My neovim config 

What have I done! 'cause I had nothing better to do...

This is my personal setup, it was supposed to very basic, very straightforward...

Things in here are all new to me, like:
- Vim
- Neovim
- Lua

## Inspiration

This configuration is heavily inspired by

- https://github.com/LunarVim/Neovim-from-scratch
- https://github.com/ibhagwan/nvim-lua
- https://github.com/wbthomason/dotfiles/tree/linux/neovim/.config/nvim

A good video resource for understanding usage

- https://odysee.com/@chrisatmachine

## Issues

Error for spell files not found:

```shell
$ nvim -u NORC -c 'set spelllang=pt_pt spell'
$ nvim -u NORC -c 'set spelllang=de_de spell'
```

AFAIK can happen that file is not downloaded because of wrong url event if triggered.
