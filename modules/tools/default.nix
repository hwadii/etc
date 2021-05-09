{ pkgs, ... }:
{
  wadii.home = {
    home.packages = with pkgs; [
      bat
      docker-compose
      exa
      fd
      fzf
      jq
      neovim
      tmux
      youtube-dl
      zsh
    ];
  };
}
