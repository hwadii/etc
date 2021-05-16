{ config, pkgs, lib, ...}:
{
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
}
