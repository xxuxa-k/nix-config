{ pkgs, ... }:

{
  home.stateVersion = "26.05";

  xdg.enable = true;

  xdg.configFile."nvim".source = ../xdgconfig/nvim;
  xdg.configFile."git".source = ../xdgconfig/git;
  xdg.configFile."mise".source = ../xdgconfig/mise;
  xdg.configFile."starship".source = ../xdgconfig/starship;
  xdg.configFile."fish".source = ../xdgconfig/fish;
  xdg.configFile."vim".source = ../xdgconfig/vim;
  xdg.configFile."sqlite3".source = ../xdgconfig/sqlite3;
  xdg.configFile."wezterm".source = ../xdgconfig/wezterm;

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
