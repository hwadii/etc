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

  lorem = pkgs.writeScriptBin "lorem" ''
    #!${pkgs.stdenv.shell}

    cat <<LOREM
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sollicitudin
    posuere felis. Integer at bibendum nibh, a sollicitudin augue. Praesent non
    ultricies urna, eu sollicitudin leo. Nullam at turpis id nisl suscipit euismod
    sed sit amet neque. Aliquam consequat, tellus eget condimentum aliquam, risus
    nisi vulputate sapien, et ullamcorper dui tortor semper lectus. Aliquam erat
    volutpat. Curabitur non sapien ipsum. Cras imperdiet varius fermentum."
    LOREM
  '';

  standup = pkgs.writeScriptBin "standup" ''
    #!${pkgs.stdenv.shell}
    yesterday=$1
    today=$2
    cat <<MSG
    Hello everyone!
    - yesterday: $yesterday
    - today: $today
    MSG
  '';
in {
  environment.systemPackages = [
    getSong
    lorem
    standup
  ];
}
