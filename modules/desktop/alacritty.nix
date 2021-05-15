{ config, pkgs, lib, ...}:
let
  cfg = config.wadii.desktop.alacritty;
in
with lib; {
  options = {
    wadii.desktop.alacritty.enable = mkEnableOption "Enable the Alacritty terminal emulator";
  };

  config = mkIf cfg.enable {
    wadii.home.programs.alacritty = {
      enable = true;
      settings = {
        window.gtk_theme_variant = "dark";
        font = {
          normal.family = "mono";
          size = 12;
          offset = {
            x = 0;
            y = 2;
          };
          glyph_offset = {
            x = 0;
            y = 1;
          };
        };
        mouse.hide_when_typing = true;
        import = [
          "/etc/nixos/config/alacritty/github_dark.yml"
        ];
      };
    };
  };
}
