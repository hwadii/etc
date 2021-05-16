{ config, lib, pkgs, ... }:
{
  wadii.home = {
    xdg.enable = true;
    xdg.userDirs.enable = true;
    xdg.userDirs.desktop = "/home/wadii/.cache/junk";
    xdg.userDirs.download = "/home/wadii/dl";
    xdg.userDirs.publicShare = "/home/wadii/.cache/junk/pub";
    xdg.userDirs.documents = "/home/wadii/dox";
    xdg.userDirs.music = "/home/wadii/music";
    xdg.userDirs.pictures = "/home/wadii/pics";
    xdg.userDirs.templates = "/home/wadii/.cache/junk/tpl";
    xdg.userDirs.videos = "/home/wadii/videos";

    home.packages = with pkgs; [ xdg_utils xdg-user-dirs ];

    home.sessionVariables = {
      XDG_CONFIG_HOME = "/home/wadii/.config";
      XDG_DATA_HOME = "/home/wadii/.local/share";
      XDG_CACHE_HOME = "/home/wadii/.cache";
    };
  };
}
