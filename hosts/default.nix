{ pkgs, inputs, ... }:

let
  username = "userx";
in
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  users.users.${username}.home = "/Users/${username}";
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
    inputs.neovim-nightly.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  fonts.packages = [
    pkgs.nerd-fonts.hack
  ];

  # Compatibility baseline for the first installation; do not bump routinely.
  system.stateVersion = 6;
}
