-- Installation of plugins go here
return packer.startup(function(use)

    use 'mohretz/gruvbox'

    if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
