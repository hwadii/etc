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

  users.users.wadii = {
    hashedPassword = "$6$W11.ka2n6T3knN$bJLxQS9X2EH2s1WmeeEcTOdBtCY07GPNXjtwH7l3qN9feUo54av6arvDkslYbLI1ZcC4Da.nC6NshzvG4pKJO0";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6ttW3sNcZkuYnmR8YnC3E3V/Qxdm7D1eUOfs/Akx436N5g4HDJdpprmHuAgpV0HoaQ9Px9Dz0Y44806/UlSkrYpvV7GO05Q9bhEliubjRM6nllop9WsLiC771i5R/UGvVJfBoohlhZueliMqRAppQav2EfRgvhcyYOhrQlMA4gWGqR4RVWM8IGOMPv635lJVyYBBDHUhOW3kickn1Ytzny4IK3a4LjljsEmPnAWj9WRNWNXAu4RJlCY9bkDThuyo3DOPowDZOe/3EUmXwm6BH9ppsaQtYqgwQmO1r3m/CP0jmMgYL+F/xrrGxUFTsOf1viJMGvPZ/UzuMXXPvbYHsdwerEkkfdBCl52D5ySjG8aXr1GpHwdBzQmKLk8C6V5FoZRibDE1Q9AJfykahe8rkl+GB8Wxjj2WeViKgqlQYcC3EsTWc6CTl1FUI3rX938fDQhUFRZ7UqkEaev/9qRhsERqtDBuELHcRTURDtckZdO6xJ0SsRNEM7hGcxicgTQ221nDj7NALOmbhAOL2e0XD4JcguX/7KSofrR+Lqd5NdtkoKF0JfWS3zkbO1K52hkw/om//MehSHEqNhC1U/45P6Ll3wZOrxEmByS7wNjbEmKOFp1bhD3QTuUiRapagCe+5YsRAjBOUV/dd5Sy6XSVPLXl3iHGuE5VnmHnG1KqgrQ== nix"
    ];
  };

  wadii.langSupport.enable = true;

  wadii.graphicalSession = {
    enable = true;
    desktop = "sway";
  };

  wadii.gui.work.enable = false;
}
