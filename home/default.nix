{
  home.stateVersion = "26.05";

  xdg.enable = true;
  xdg.configFile."nvim".source = ../xdgconfig/nvim;
  xdg.configFile."git".source = ../xdgconfig/git;
  xdg.configFile."mise".source = ../xdgconfig/mise;
  xdg.configFile."tmux".source = ../xdgconfig/tmux;
  xdg.configFile."starship".source = ../xdgconfig/starship;

  programs.zsh = {
    enable = true;

    prezto = {
      enable = true;
      editor.keymap = "emacs";
      prompt.theme = "sorin";

      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "utility"
        "completion"
        "syntax-highlighting"
        "history-substring-search"
        "prompt"
      ];
    };
  };
}
