{
  description = "kzzzl's nixos configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    apple-silicon-support.url = "github:nix-community/nixos-apple-silicon";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    apple-silicon-support,
    ...
  } @ inputs: {
    nixosConfigurations.nixpc-btw = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/nixpc-btw/configuration.nix
        ./hosts/common.nix

        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.kzzzl = import ./home/home.nix;
        }
      ];
    };

    nixosConfigurations.nixmac-btw = nixpkgs.lib.nixosSystem {
      modules = [
        ./hosts/nixmac-btw/configuration.nix
        ./hosts/common.nix

        home-manager.nixosModules.home-manager
        apple-silicon-support.nixosModules.apple-silicon-support
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.kzzzl = import ./home/home.nix;
        }
      ];
    };
  };
}
