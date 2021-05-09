{ config, lib, pkgs, ... }:
{
  wadii.home = {
    home.packages = with pkgs; [
      firefox-wayland
      foliate
      gimp
      imv
      libreoffice-fresh
      pavucontrol
      qbittorrent
      spotify
      thunderbird
      xfce.thunar
      zathura
      # zoom-us
    ];
  };
}
