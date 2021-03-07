{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  shell = import ./shell.nix;
in
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget sxhkd sway wlroots wofi thunderbird firefox-devedition-bin zsh docker
    git youtube-dl fd brightnessctl ripgrep fzf bspwm zoxide exa docker-compose
    coreutils redshift-wlr geoclue2 spotify xfce.thunar neovim zathura
    playerctl tmux rustup wlsunset bat
  ];

  programs.zsh = {
    enable = true;
    histSize = 999999;
    histFile = "/home/wadii/.zsh_history";
    shellAliases = shell.alias;
    interactiveShellInit = ''
    ${shell.functions}

    ${shell.misc}
    '';
    setOptions = shell.options;
  };

  environment.variables = shell.var;

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = with pkgs; [
      swaylock
      swayidle
      wl-clipboard
      mako
      wofi
      alacritty
      imv
      grim
      slurp
      swaybg
      wf-recorder
      xdg-desktop-portal-wlr

      xwayland
    ];
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh.enable = true;
}
