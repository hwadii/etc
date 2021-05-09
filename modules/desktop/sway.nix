{ config, pkgs, lib, ... }:
let
  cfg = config.wadii.desktop.sway;
in
with lib; {
  options = {
    wadii.desktop.sway = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = "Enable the Sway Wayland compositor.";
      };
    };
  };

  config = mkIf cfg.enable {
    programs.sway.enable = true;
  };
}
