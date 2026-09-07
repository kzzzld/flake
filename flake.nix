{
  description = "kzzzl's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs: {
    nixosConfigurations.nixpc-btw = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/nixpc-btw/configuration.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.kzzzl = import ./home/home.nix;
        }
      ];
    };
  };
}
