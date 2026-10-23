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

  outputs = inputs@{ self, nix-darwin, home-manager, ... }: {
    darwinConfigurations."default" = nix-darwin.lib.darwinSystem {
      specialArgs = { inherit inputs; };

      modules = [
        ./hosts/default.nix
        { system.configurationRevision = self.rev or self.dirtyRev or null; }

        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.userx = ./home/default.nix;
        }
      ];
    };
  };
}
