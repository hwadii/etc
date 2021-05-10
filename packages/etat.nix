{ pkgs, fetchFromGitHub, rustPlatform, lib, ... }:
rustPlatform.buildRustPackage rec {
  pname = "etat";
  version = "";

  src = fetchFromGitHub {
    owner = "hwadii";
    repo = "etat";
    rev = "master";
    sha256 = "grxfYtom1AG+Mf5/6LYd6xhffXhKtw4a9Vu64lOCzNY=";
  };

  cargoSha256 = "TwLAFis4cGwQNagUrwmPUIVeANGTMyxFNBtIX7/Ltr4=";

  buildInputs = with pkgs; [ dbus ];
  nativeBuildInputs = with pkgs; [ pkg-config ];

  dbus = pkgs.dbus;

  meta = with lib; {
    description = "System information for statusbar";
    homepage = "https://github.com/hwadii/etat/";
    maintainers = [ maintainers.wadii ];
    platforms = platforms.all;
  };
}
