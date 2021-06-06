{ pkgs, fetchFromGitHub, rustPlatform, lib, ... }:
rustPlatform.buildRustPackage rec {
  pname = "etat";
  version = "";

  src = fetchFromGitHub {
    owner = "hwadii";
    repo = "etat";
    rev = "master";
    sha256 = "0xdla65fwwyf575f2v912x10qjbhs3d6v5bgh2vvgdif9jry2imx";
  };

  cargoSha256 = "wak/telsDB9nKSSd4w79kwZ5vFLzBA4SqXhXGcTco9I=";

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
