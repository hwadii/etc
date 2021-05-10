[
  (self: super: with super; rec {
    wadii = {
      smart-pwd = callPackage ./smart-pwd.nix {};
      etat = callPackage ./etat.nix {};
    };
  })
]
