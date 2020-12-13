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
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_CACHE_HOME = "$HOME/.cache";

    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    LESS = "--RAW-CONTROL-CHARS --mouse -Ri";
    RIPGREP_CONFIG_PATH = "$XDG_CONFIG_HOME/ripgrep/ripgreprc";
    SUDO_PROMPT = "$'\e[35m[sudo]\e[33m password for %p:\e[0m '";
    FZF_DEFAULT_COMMAND = "fd --type f --follow --hidden -E'.git'";
    FZF_DEFAULT_OPTS = "--height 40% --bind 'tab:down' --bind 'btab:up' --bind 'ctrl-s:toggle'";
  };
}
