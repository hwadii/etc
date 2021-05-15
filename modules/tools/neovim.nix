{ config, pkgs, libs, ... }:
{
  wadii.home = {
    home.packages = with pkgs; [
      neovim-nightly
      rust-analyzer
      nodePackages.typescript
      nodePackages.typescript-language-server
      nodePackages.vscode-css-languageserver-bin
      nodePackages.vscode-html-languageserver-bin
      nodePackages.vscode-json-languageserver-bin
    ];

    xdg.configFile."nvim" = {
      source = /etc/nixos/config/nvim;
      recursive = true;
    };
  };
}
