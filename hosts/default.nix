{ pkgs, inputs, ... }:

let
  username = "userx";
in
{
  nixpkgs.hostPlatform = "aarch64-darwin";
  programs.fish.enable = true;

  users.users.${username} = {
    home = "/Users/${username}";
    shell = pkgs.fish;
  };
  system.primaryUser = username;
  system.defaults.dock.mru-spaces = false;

  # Keep the existing upstream Nix installation and nix.conf unmanaged.
  nix.enable = false;

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
    pkgs.nil
    pkgs.gh
    pkgs.fish
    inputs.neovim-nightly.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  environment.shells = [ pkgs.fish ];

  fonts.packages = [
    pkgs.nerd-fonts.hack
  ];

  # Compatibility baseline for the first installation; do not bump routinely.
  system.stateVersion = 6;
}
