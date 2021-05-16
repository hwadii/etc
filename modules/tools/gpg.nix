{
  wadii.home = {
    programs.gpg.enable = true;
    services.gpg-agent = {
      enable = true;
      enableSshSupport = false;
      pinentryFlavor = "curses";
    };
  };

  programs.ssh.startAgent = true;
}
