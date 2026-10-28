{ pkgs, username, ... }:

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
    trackpad = {
      Clicking = true;
    };
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
      KeyRepeat = 1;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = true;
      AppleEnableSwipeNavigateWithScrolls = true;
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

  security.pam.services.sudo_local.touchIdAuth = true;

  environment.systemPackages = [
    pkgs.wezterm
  ];

  programs.fish.enable = true;

  # wslのためにhome-managerに移動することはできない
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
