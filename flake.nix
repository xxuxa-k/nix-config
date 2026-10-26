{
  description = "Experimental nix-darwin configuration for personal Mac";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, home-manager, ... }:
    let
      username = "userx";
    in {
      darwinConfigurations."default" = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs username; };

        modules = [
          ./hosts/mac/default.nix
          { system.configurationRevision = self.rev or self.dirtyRev or null; }

          home-manager.darwinModules.home-manager
          {
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.${username} = {
              imports = [ ./home/default.nix ];
              programs.fish = {
                enable = true;
                interactiveShellInit = builtins.readFile ./xdgconfig/fish/config.fish;
              };
              xdg.configFile."fish/functions".source = ./xdgconfig/fish/functions;
              xdg.configFile."wezterm".source = ./xdgconfig/wezterm;
            };
          }
        ];
      };

      homeConfigurations."wsl" = home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;

        extraSpecialArgs = { inherit inputs username; };

        modules = [
          ./hosts/wsl/default.nix
        ];
      };
    };
}
