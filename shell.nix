{
  alias = {
    sard  =  "mpv https://twitch.tv/sardoche --quiet >/dev/null &";
    kameto  =  "mpv https://www.twitch.tv/kamet0 --quiet >/dev/null &";
    coro  =  "mpv https://twitch.tv/corobizar --quiet >/dev/null &";
    open  =  "xdg-open";

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
  };

  var = {
    XDG_CONFIG_HOME = "/home/wadii/.config";
    XDG_DATA_HOME = "/home/wadii/.local/share";
    XDG_CACHE_HOME = "/home/wadii/.cache";
    XDG_LOCAL_BIN = "/home/wadii/.local/bin";
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_WEBRENDER = "1";

    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    LESS = "--RAW-CONTROL-CHARS --mouse -Ri";
    RIPGREP_CONFIG_PATH = "/home/wadii/.config/ripgrep/ripgreprc";
    FZF_DEFAULT_COMMAND = "fd --type f --follow --hidden -E'.git'";
    FZF_DEFAULT_OPTS = "--height 40% --bind 'tab:down' --bind 'btab:up' --bind 'ctrl-s:toggle'";
    ZSH_CACHE_DIR = "/home/wadii/.cache";
  };

  functions = ''
    fe() (
      IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0 --preview "bat --style numbers,changes --color=always --decorations=always {} | head -500"))
      [[ -n "$files" ]] && ''${EDITOR:-vim} "''${files[@]}"
    )

    fo() (
      IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
      key=$(head -1 <<< "$out")
      file=$(head -2 <<< "$out" | tail -1)
      if [ -n "$file" ]; then
        [ "$key" = ctrl-o ] && open "$file" || ''${EDITOR:-vim} "$file"
      fi
    )


    function open_command() {
      local open_cmd

      # define the open command
      case "$OSTYPE" in
        darwin*)  open_cmd='open' ;;
        cygwin*)  open_cmd='cygstart' ;;
        linux*)   [[ "$(uname -r)" != *icrosoft* ]] && open_cmd='nohup xdg-open' || {
                    open_cmd='cmd.exe /c start ""'
                    [[ -e "$1" ]] && { 1="$(wslpath -w "''${1:a}")" || return 1 }
                  } ;;
        msys*)    open_cmd='start ""' ;;
        *)        echo "Platform $OSTYPE not supported"
                  return 1
                  ;;
      esac

      ''${=open_cmd} "$@" &>/dev/null
    }

    function zreload() {
      local cache="$ZSH_CACHE_DIR"
      autoload -U compinit zrecompile
      compinit -i -d "$cache/zcomp-$HOST"

      for f in ''${ZDOTDIR:-~}/.zshrc "$cache/zcomp-$HOST"; do
        zrecompile -p $f && command rm -f $f.zwc.old
      done

      [[ -n "$SHELL" ]] && exec ''${SHELL#-} || exec zsh
    }
  '';

  misc = ''
    stty -ixon -ixoff

    bindkey -e

    zstyle ':completion:*' menu select

    autoload -Uz bracketed-paste-magic
    zle -N bracketed-paste bracketed-paste-magic
    eval "$(zoxide init zsh)"
    [ -f $HOME/Documents/creds.zsh ] && source $HOME/Documents/creds.zsh
    [ -f ~/code/git/git-extras/etc/git-extras-completion.zsh ] && source ~/code/git/git-extras/etc/git-extras-completion.zsh

    bindkey "^R" history-search-multi-word
    if [[ -n "''${terminfo[kcbt]}" ]]; then
      bindkey -M emacs "''${terminfo[kcbt]}" reverse-menu-complete
      bindkey -M viins "''${terminfo[kcbt]}" reverse-menu-complete
      bindkey -M vicmd "''${terminfo[kcbt]}" reverse-menu-complete
    fi
    bindkey "^Xa" _expand_alias
    autoload -U edit-command-line

    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
  '';

  options = [
    "EXTENDED_HISTORY" "HIST_EXPIRE_DUPS_FIRST" "HIST_IGNORE_DUPS"
    "HIST_IGNORE_SPACE" "HIST_VERIFY" "INC_APPEND_HISTORY" "SHARE_HISTORY"
    "HIST_FIND_NO_DUPS" "HIST_REDUCE_BLANKS" "EXTENDED_GLOB" "EQUALS"
    "PROMPT_SUBST" "AUTO_CD" "INTERACTIVECOMMENTS" "AUTO_CONTINUE"
    "AUTO_PARAM_SLASH" "PUSHD_IGNORE_DUPS" "AUTO_PUSHD"
  ];
}
