{ lib, pkgs, ... }: {
  imports = [
    ./keymap.nix
    #./lsp.nix
    ./opts.nix
    ./plugins.nix
  ];

  clipboard.providers.wl-copy.enable = true;
  extraConfigLuaPost = ''
    if vim.env.TERM == "tmux-256color" then
      vim.cmd 'colorscheme base16-macintosh'
    end
  '';
  extraConfigVim = ''
    vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
  '';

}

