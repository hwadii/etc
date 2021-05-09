{ config, pkgs, ... }:

let
  shell = import ./shell.nix;
in
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  programs.zsh = {
    enable = true;
    histSize = 999999;
    histFile = "/home/wadii/.zsh_history";
    shellAliases = shell.alias;
    interactiveShellInit = ''
    ${shell.functions}

    ${shell.misc}
    '';
    shellInit = shell.init;
    setOptions = shell.options;
  };

  environment.variables = shell.var;
}
