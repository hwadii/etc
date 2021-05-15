{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./neovim.nix
  ];

  wadii.home = {
    home.packages = with pkgs; [
      bat
      wadii.smart-pwd
      wadii.etat
      tre-command
      docker-compose
      exa
      fd
      fzf
      jq
      tmux
      youtube-dl
    ];
  };
}
