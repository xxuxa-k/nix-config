{
  home.stateVersion = "26.05";

  xdg.enable = true;
  xdg.configFile."nvim".source = ../xdgconfig/nvim;
  xdg.configFile."git".source = ../xdgconfig/git;
  xdg.configFile."mise".source = ../xdgconfig/mise;
  xdg.configFile."tmux".source = ../xdgconfig/tmux;
  xdg.configFile."starship".source = ../xdgconfig/starship;

  #   programs.fish = {
  #     enable = true;
  #
  #     shellInit = ''
  #       set -gx EDITOR nvim
  #       set -gx GIT_EDITOR nvim
  #       set -gx STARSHIP_CONFIG "$HOME/.config/startship/config.toml"
  #     '';
  #
  #     interactiveShellInit = ''
  #       # 対話操作向けの設定
  #     '';
  #   };
}
