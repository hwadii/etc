{ config, pkgs, ... }:

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) {};
  shell = import ./shell.nix;
in
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ sway wlroots ];

  programs.zsh = {
    enable = true;
    histSize = 999999;
    histFile = "/home/wadii/.zsh_history";
    shellAliases = shell.alias;
    interactiveShellInit = ''
    ${shell.functions}

    ${shell.misc}
    '';
    shellInit = shell.init;
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
      grim
      slurp
      swaybg
      wf-recorder
      xdg-desktop-portal-wlr
      redshift-wlr
      geoclue2

      xwayland
    ];
  };
}
