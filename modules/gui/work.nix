{ config, lib, pkgs, ... }:
let
  cfg = config.wadii.gui.work;
in
with lib; {
  options = {
    wadii.gui.work = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = "Enable work related software.";
      };
    };
  };

  config = mkIf cfg.enable {
    wadii.home = {
      home.packages = with pkgs; [ zoom-us slack ];
    };
  };
}
