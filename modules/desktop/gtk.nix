{ config, lib, pkgs, ... }:
let
  cfg = config.wadii.desktop.gtk;
in
with lib; {
  options = {
    wadii.desktop.gtk.enable = mkEnableOption "Enable GTK config";
  };

  config = mkIf cfg.enable {
    wadii.home = {
      gtk = {
        enable = true;
        font = {
          name = "Source Sans Pro 11";
        };
        iconTheme = {
          name = "Adwaita";
        };
        theme = {
          name = "Adwaita";
        };
        gtk3.extraConfig = {
          gtk-application-prefer-dark-theme = true;
          gtk-cursor-theme-name = "Adwaita";
        };
        gtk2.extraConfig = ''
          gtk-application-prefer-dark-theme=true
          gtk-cursor-theme-name="Adwaita"
        '';
      };

      dconf = {
        enable = true;
        settings = {
          "org/gnome/desktop/interface" = {
            gtk-theme = "Adwaita";
            icon-theme = "Adwaita";
            cursor-theme = "Adwaita";
            font-name = "Source Sans Pro 11";
          };
        };
      };
    };
  };
}
