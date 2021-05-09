{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
  ];

  wadii.home = {
    home.packages = with pkgs; [
      bat
      tre-command
      docker-compose
      exa
      fd
      fzf
      jq
      neovim
      tmux
      youtube-dl
    ];
  };
}
