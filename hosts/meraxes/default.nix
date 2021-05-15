{ config, pkgs, lib, ... }:
{
  imports = [
    <home-manager/nixos>
    ./hardware.nix
  ];
  networking.hostName = "meraxes";
  networking.networkmanager.enable = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.cleanTmpDir = true;
  boot.blacklistedKernelModules = [ "snd_pcsp" ];

  networking.useDHCP = false;
  networking.interfaces.enp0s20f0u1.useDHCP = true;
  networking.interfaces.wlp58s0.useDHCP = true;

  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraConfig = ''
      load-module module-switch-on-connect
    '';
  };

  services.printing.enable = false;

  wadii.langSupport.enable = true;

  wadii.graphicalSession = {
    enable = true;
    desktop = "sway";
  };

  wadii.gui.work.enable = false;
}
