[
  (self: super: with super; rec {
    wadii = {
      smart-pwd = callPackage ./smart-pwd.nix {};
      etat = callPackage ./etat.nix {};
    };
  })
  (import (builtins.fetchTarball {
     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
   }))
]
