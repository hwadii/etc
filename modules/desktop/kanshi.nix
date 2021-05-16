{
  wadii.home = {
    services.kanshi = {
      enable = true;
      profiles = {
        a = {
          outputs = [
            {
              criteria = "eDP-1";
              status = "disable";
            }
            {
              criteria = "Dell Inc. DELL U2419H J6MYV13";
              mode = "1920x1080";
              position = "0,0";
            }
          ];
        };
        b = {
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
            {
              criteria = "*";
              mode = "1920x1080";
              position = "0,0";
            }
          ];
        };
        c = {
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
          ];
        };
      };
    };
  };
}
