{ pkgs, inputs, config, ... }:

let
  githubusername = "xxuxa-k";
in
  {
  home.stateVersion = "26.05";

  home.packages = [
    pkgs.go_latest
    pkgs.gopls
    pkgs.deno
    pkgs.starship
    pkgs.ghq
    pkgs.go-task
    pkgs.ripgrep
    pkgs.mise
    pkgs.direnv
    pkgs.zoxide
    pkgs.nixd
    pkgs.gh
    pkgs.fish
    pkgs.zsh
    pkgs.bat
    pkgs.tree-sitter
    pkgs.peco
    pkgs.eza
    pkgs.fzf
    pkgs.delta
    pkgs.jdk
    pkgs.jdt-language-server
    pkgs.metals
    pkgs.scala
    pkgs.sqlite
    pkgs.python3
    pkgs.uv
    pkgs.openssl
    pkgs.certbot
    pkgs.awscli2
    pkgs.ssm-session-manager-plugin
    pkgs.lemminx
    pkgs.lazygit
    pkgs.jq
    pkgs.bruno
    inputs.neovim-nightly.packages.${pkgs.stdenv.hostPlatform.system}.default
    (pkgs.callPackage ../packages/slack-cli.nix {})
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    STARSHIP_CONFIG = "${config.xdg.configHome}/starship/config.toml";
    NB_DIR = "${config.home.homeDirectory}/ghq/github.com/${githubusername}/nb";
  };

  xdg.enable = true;

  xdg.configFile."nvim".source = ../xdgconfig/nvim;
  xdg.configFile."git".source = ../xdgconfig/git;
  xdg.configFile."mise".source = ../xdgconfig/mise;
  xdg.configFile."starship".source = ../xdgconfig/starship;
  xdg.configFile."vim".source = ../xdgconfig/vim;
  xdg.configFile."sqlite3".source = ../xdgconfig/sqlite3;
  xdg.configFile."lazygit".source = ../xdgconfig/lazygit;

  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    escapeTime = 0;
    terminal = "tmux-256color";
    plugins = [
      pkgs.tmuxPlugins.yank
    ];
    extraConfig = builtins.readFile ../xdgconfig/tmux/tmux.conf;
  };
}
