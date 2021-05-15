{ config, pkgs, lib, ... }:
let
  cfg = config.wadii.desktop.sway;
in
with lib; {
  options = {
    wadii.desktop.sway.enable = mkEnableOption "Enable the Sway Wayland compositor.";
  };

  config = mkIf cfg.enable {
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
        sway-contrib.grimshot
        swaybg
        wf-recorder
        redshift-wlr
        geoclue2

        xwayland
      ];
      extraSessionCommands = ''
        export XDG_CURRENT_DESKTOP=sway
        export XDG_SESSION_TYPE=wayland
        systemctl --user import-environment
      '';
    };

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [ xdg-desktop-portal-wlr ];
    };
  };
}
