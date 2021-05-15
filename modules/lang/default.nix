{ config, lib, pkgs, ... }:
let
  cfg = config.wadii.langSupport;
in
with lib; {
  imports = [
    ./rust.nix
    ./c.nix
  ];

  options = {
    wadii.langSupport = {
      enable = mkOption {
        default = false;
        type = types.bool;
        description = ''
          Wildcard for language support.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    wadii.languages = {
      rust.enable = true;
      c.enable = true;
    };
  };
}
