{ pkgs, ... }:

let
  getSong = pkgs.writeScriptBin "get_song" ''
    #!${pkgs.stdenv.shell}
    # playerctl -p spotify metadata --format '{{artist}} -- {{title}}'
    status=$(playerctl -p spotify status)
    song="{{artist}} -- {{title}}"
    
    format() {
      playerctl -p spotify metadata --format "$1"
    }
    
    if [ "$status" = "" ]
    then
      echo "No players found"
    fi
    if [ "$status" == "Paused" ]
    then
      echo $(format "(Paused) $song")
    else
      echo $(format "$song")
    fi
    '';
in {
  environment.systemPackages = [
    getSong
  ];
}
