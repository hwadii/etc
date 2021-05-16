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
        bemenu
        brightnessctl
        clipman
        i3
        mpv
        playerctl
        wlsunset
        wofi
        zoxide
      ];

      # convert those into nix files
      xdg.configFile."bat/config".source = /etc/nixos/config/bat/config;
      xdg.configFile."newsboat/config".source = /etc/nixos/config/newsboat/config;
      xdg.configFile."newsboat/urls".source = /etc/nixos/config/newsboat/urls;
      xdg.configFile."ripgrep/ripgreprc".source = /etc/nixos/config/ripgrep/ripgreprc;
      xdg.configFile."sway/config".source = /etc/nixos/config/sway/config;
      xdg.configFile."swaylock/config".source = /etc/nixos/config/swaylock/config;
      xdg.configFile."i3/config".source = /etc/nixos/config/i3/config;
    };
  };
}
