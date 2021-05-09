{ config, lib, pkgs, ... }:
{
  imports = [
    ./work.nix
  ];

  wadii.home = {
    home.packages = with pkgs; [
      discord
      firefox-wayland
      foliate
      gimp
      imv
      libreoffice-fresh
      newsboat
      pavucontrol
      qbittorrent
      spotify
      thunderbird
      weechat
      xfce.thunar
      zathura
    ];
  };
}
