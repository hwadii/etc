{ config, lib, pkgs, ... }:
let
  cfg = config.wadii.languages.c;
in
with lib; {
  options = {
    wadii.languages.c.enable = mkEnableOption "Support for C/C++";
  };

  config = mkIf cfg.enable {
    wadii.home = {
      home.packages = with pkgs; [ gcc ];
    };
  };
}
