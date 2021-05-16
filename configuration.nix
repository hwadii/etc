{ options, config, pkgs, lib, ... }:

{
  imports =
    [
      ./hosts/current
      <home-manager/nixos>
      ./scripts.nix
      ./modules
    ];

  i18n.defaultLocale = "en_US.UTF-8";

  time.timeZone = "Europe/Paris";

  virtualisation.docker.enable = true;

  nixpkgs.overlays = import /etc/nixos/packages;
  nixpkgs.config.allowUnfree = true;

  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
    trustedUsers = [ "root" "wadii" ];
  };

  services.xserver = {
    enable = true;
    layout = "gb";
    xkbOptions = "eurosign:e,compose:rctrl";
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  services.gnome.gnome-keyring.enable = true;

  fonts.fontconfig.enable = true;

  fonts.fonts = with pkgs; [
    fira-code
    fira-code-symbols
    jetbrains-mono
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    ipafont
    source-sans-pro
    source-serif-pro
    font-awesome
  ];

  environment.systemPackages = with pkgs; [
    coreutils
    git
    killall
    unzip
    wget
    vim
    gnumake
  ];

  services.xserver.libinput.enable = true;

  home-manager.users.wadii = lib.mkAliasDefinitions options.wadii.home;

  users.mutableUsers = false;
  users.users.wadii = {
    isNormalUser = true;
    home = "/home/wadii";
    description = "Wadii Hajji";
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "docker" "audio" "video" "networkmanager" ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?

}

