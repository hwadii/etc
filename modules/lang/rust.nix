{ config, lib, pkgs, ... }:
let
  cfg = config.wadii.languages.rust;
in
with lib; {
  options = {
    wadii.languages.rust = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Support for the Rust programming language.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    wadii.home = {
      home.packages = with pkgs; [
        rustup
        carnix
        rust-analyzer
      ];
    };
  };
}
