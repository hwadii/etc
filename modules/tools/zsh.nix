{ config, lib, pkgs, ... }:
let
  gitPlugin = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/git/git.plugin.zsh";
    sha256 = "08kar0kj38gajzmmr5jban7dgq5j1sv1p7a7av20ffchwn219vlk";
  };
  gitLib = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/lib/git.zsh";
    sha256 = "0xph4wydnmgp1fc9rz2wm75rva5p3y1shnsdfa4sqkn953k21rns";
  };
  gitPrompt = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh";
    sha256 = "07p9mnidla6cfba7nzghj1pv3xq87favf802zhdr5wvwhqiqrzsl";
  };
in {
  wadii.home = {
    programs.zsh = {
      enable = true;
      history.size = 999999;
      defaultKeymap = "emacs";
      initExtra = (builtins.readFile /etc/nixos/config/zsh/zshrc) +
      ''
      source "${gitLib}"
      source "${gitPlugin}"
      source "${gitPrompt}"
      source "/etc/nixos/config/zsh/theme.zsh"
      '';
      envExtra = (builtins.readFile /etc/nixos/config/zsh/zshenv);
      dotDir = ".config/zsh";
      profileExtra = ''
        export MOZ_ENABLE_WAYLAND=1;
        export MOZ_WEBRENDER=1;
      '';
      sessionVariables = {
        XDG_CONFIG_HOME = "/home/wadii/.config";
        XDG_DATA_HOME = "/home/wadii/.local/share";
        XDG_CACHE_HOME = "/home/wadii/.cache";
        XDG_LOCAL_BIN = "/home/wadii/.local/bin";

        EDITOR = "nvim";
        VISUAL = "nvim";
        BROWSER = "firefox";
        LESS = "--RAW-CONTROL-CHARS --mouse -Ri";
        RIPGREP_CONFIG_PATH = "/home/wadii/.config/ripgrep/ripgreprc";
        ZSH_CACHE_DIR = "/home/wadii/.cache";
      };
      shellAliases = {
        sard = "mpv https://twitch.tv/sardoche --quiet >/dev/null &";
        kameto = "mpv https://www.twitch.tv/kamet0 --quiet >/dev/null &";
        coro = "mpv https://twitch.tv/corobizar --quiet >/dev/null &";
        open = "xdg-open";

        rm = "rm -v";
        cp = "cp -v";
        mv = "mv -v";
        md = "mkdir -p";

        ls = "exa --git --group-directories-first";
        l = "ls";
        ll = "exa --git --group-directories-first -l";
        la = "exa --git --group-directories-first -l -a";
        lk = "exa --git --group-directories-first -l -s=size";
        lm = "exa --git --group-directories-first -l -s=modified";
        lc = "exa --git --group-directories-first --created -s=created";
        lt = "exa --git --group-directories-first --tree --git-ignore";
        lr = "exa --git --group-directories-first -R --git-ignore";

        vim = "nvim";
        ezsh = "nvim ~/.zshrc";
        rzsh = ". ~/.zshrc";
        wholistens = "netstat -tulpn | rg LISTEN";

        ni = "npm install";
        nin = "npm init";
        nu = "npm update";
        nis = "npm i -S";
        nid = "npm i -D";
        nig = "npm i -g";
        nr = "npm run";
        nrs = "npm run start";
        nrss = "npm run start:staging";
        nrb = "npm run build";
        nrt = "npm run test";
        nrc = "npm run commit";

        mp3 = "youtube-dl -x --embed-thumbnail --audio-format mp3";
        ytdl = "youtube-dl";

        gin = "git init";
        gcd = "git checkout dev";
        gdf = "git diff FETCH_HEAD";

        dc = "docker-compose";
        e2e = "docker-compose -f ~/code/cardiologs/front/cypress/docker-compose.yml";
        gs = "cowsay \"It's gss, idiot!\"";

        ta = "tmux attach -t";
        tad = "tmux attach -d -t";
        tkss = "tmux kill-session -t";
        tksv = "tmux kill-server";
        tl = "tmux list-sessions";
        ts = "tmux new-session -s";

        nsw = "sudo nixos-rebuild switch";
      };

      plugins = [
        {
          name = "fast-syntax-highlighting";
          src = pkgs.fetchFromGitHub {
            owner = "zdharma";
            repo = "fast-syntax-highlighting";
            rev = "master";
            sha256 = "4xJXH9Wn18/+Vfib/ZrhCRp/yB1PppsbZCx1/WafmU8=";
          };
        }
        {
          name = "history-search-multi-word";
          src = pkgs.fetchFromGitHub {
            owner = "zdharma";
            repo = "history-search-multi-word";
            rev = "master";
            sha256 = "/c6unIAoe5W0rnfskwBFHi5qD5IiKqx/9824xdOOEmw=";
          };
        }
        {
          name = "zsh-history-substring-search";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-history-substring-search";
            rev = "master";
            sha256 = "Ptxik1r6anlP7QTqsN1S2Tli5lyRibkgGlVlwWZRG3k=";
          };
        }
        {
          name = "zsh-autosuggestions";
          src = pkgs.fetchFromGitHub {
            owner = "zsh-users";
            repo = "zsh-autosuggestions";
            rev = "master";
            sha256 = "xv4eleksJzomCtLsRUj71RngIJFw8+A31O6/p7i4okA=";
          };
        }
      ];
    };

    # convert those into nix files
    xdg.configFile."bat/config".source = /etc/nixos/config/bat/config;
    xdg.configFile."newsboat/config".source = /etc/nixos/config/newsboat/config;
    xdg.configFile."newsboat/urls".source = /etc/nixos/config/newsboat/urls;
    xdg.configFile."ripgrep/ripgreprc".source = /etc/nixos/config/ripgrep/ripgreprc;
    xdg.configFile."sway/config".source = /etc/nixos/config/sway/config;
    xdg.configFile."swaylock/config".source = /etc/nixos/config/swaylock/config;
  };

  environment.pathsToLink = [ "/share/zsh" ];
}
