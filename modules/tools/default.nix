{ pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./neovim.nix
    ./fzf.nix
    ./gpg.nix
  ];

  wadii.home = {
    home.packages = with pkgs; [
      bat
      docker-compose
      exa
      fd
      fzf
      jq
      nix-prefetch-scripts
      tmux
      tre-command
      wadii.etat
      wadii.smart-pwd
      youtube-dl
      zoxide
    ];
  };
}
