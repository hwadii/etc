{ config, pkgs, lib, ... }:
let
  cfg = config.wadii.power;
in
with lib; {
  config = {
    services.upower.enable = true;
  };
}

