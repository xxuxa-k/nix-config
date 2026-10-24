{ pkgs, inputs, ... }:

let
username = "userx";
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
    };
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
      inputs.neovim-nightly.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];

  programs.fish.enable = true;

  environment.shells = [
    pkgs.fish
      pkgs.zsh
  ];

  fonts.packages = [
    pkgs.nerd-fonts.hack
      pkgs.nerd-fonts.ubuntu
  ];

}
