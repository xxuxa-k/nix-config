{ username, ... }:

{
  imports = [
    ../../home/default.nix
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  targets.genericLinux.enable = true;

  programs.zsh.enable = true;

  programs.home-manager.enable = true;
}
