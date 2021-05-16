{ config, pkgs, lib, ... }:
{
  wadii.home = {
    programs.mako = {
      enable = true;
      layer = "overlay";
      backgroundColor = "#1F1F1F";
      defaultTimeout = 8000;
      groupBy = "app-name";
      borderSize = 2;
      extraConfig = ''
        [hidden]
        format=(and %h more)
        text-color=#777777

        [urgency=high]
        background-color=#c00000
        border-color=#ff0000
        ignore-timeout=1
      '';
    };
    home.packages = [ pkgs.libnotify ];
  };
}
