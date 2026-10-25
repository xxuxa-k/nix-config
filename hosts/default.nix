{ pkgs, inputs, username, ... }:

let
  githubusername = "xxuxa-k";
in
  {
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix.enable = false;

  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.fish;
  };

  system = {
    stateVersion = 6;
    primaryUser = username;
  };

  # https://github.com/nix-darwin/nix-darwin/tree/master/modules/system/defaults
  system.defaults = {
    dock = {
      mru-spaces = false;
      show-recents = false;
    };
    screencapture = {
      target = "clipboard";
      disable-shadow = true;
    };
    finder = {
      AppleShowAllExtensions = true;
      AppleShowAllFiles = true;
      ShowPathbar = true;
      ShowExternalHardDrivesOnDesktop = false;
      ShowHardDrivesOnDesktop = false;
      ShowMountedServersOnDesktop = false;
      ShowRemovableMediaOnDesktop = false;
    };
    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      "com.apple.mouse.tapBehavior" = 1;
    };
    menuExtraClock = {
      Show24Hour = true;
      ShowSeconds = true;
    };
    SoftwareUpdate = {
      AutomaticallyInstallMacOSUpdates = false;
    };
  };

  environment.variables = {
    EDITOR = "nvim";
    GIT_EDITOR = "nvim";
    STARSHIP_CONFIG = "$HOME/.config/starship/config.toml";
    NB_DIR = "$HOME/ghq/github.com/${githubusername}/nb";
  };

  environment.systemPackages = [
    pkgs.go_latest
    pkgs.gopls
    pkgs.deno
    pkgs.starship
    pkgs.ghq
    pkgs.go-task
    pkgs.tmux
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
    pkgs.sqlite
    pkgs.wezterm
    inputs.neovim-nightly.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.fish.enable = true;

  environment.shells = [
    pkgs.fish
    pkgs.zsh
  ];

  fonts.packages = [
    pkgs.nerd-fonts.hack
    pkgs.nerd-fonts.symbols-only
    pkgs.hackgen-font
    pkgs.nerd-fonts.ubuntu
  ];
}
