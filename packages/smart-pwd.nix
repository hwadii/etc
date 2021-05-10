{ fetchFromGitHub, rustPlatform, lib, ... }:
rustPlatform.buildRustPackage rec {
  pname = "smart-pwd";
  version = "";

  src = fetchFromGitHub {
    owner = "davidpdrsn";
    repo = "smart-pwd";
    rev = "master";
    sha256 = "nLKO+cEZu2d8ChxQGVL+JNH/8FdVwlJp2qW0qR1TSwA=";
  };

  cargoSha256 = "6seXnVyPZL7Ct9Yl8zdjQVJOG+X7OMEai1DtJg+Dg9w=";

  meta = with lib; {
    description = "Shortest unique pwd";
    homepage = "https://github.com/davidpdrsn/smart-pwd/";
    maintainers = [ maintainers.wadii ];
    platforms = platforms.all;
  };
}
