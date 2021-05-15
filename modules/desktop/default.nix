{ config, lib, pkgs, ... }:
let
  cfg = config.wadii.graphicalSession;
in
with lib; {
  imports = [
    ./sway.nix
    ./gtk.nix
    ./alacritty.nix
    ./mako.nix
  ];

  options = {
    wadii.graphicalSession = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Enable a graphical session, and related apps.
        '';
      };

      desktop = mkOption {
        default = "sway";
        type = types.enum [ "sway" "i3" ];
      };
    };
  };

  config = mkIf cfg.enable {
    wadii.desktop = {
      sway.enable = cfg.desktop == "sway";
      gtk.enable = true;
      mako.enable = true;
      alacritty.enable = true;
    };

    wadii.home = {
      home.packages = with pkgs; [
        alacritty
        brightnessctl
        i3
        mpv
        playerctl
        wlsunset
        wofi
        zoxide
      ];
    };
  };
}
