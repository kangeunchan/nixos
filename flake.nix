{
  description = "RKDDMSCKS NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, disko, ... }:
  {
    nixosConfigurations.rkddmscks-aarch64-linux = nixpkgs.lib.nixosSystem {
      system = "aarch64-linux";
      modules = [
        disko.nixosModules.disko
        ./modules/systems/disks.nix
        ./modules/configurations
      ];
    };

    nixosConfigurations.rkddmscks-x86_64-linux = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        disko.nixosModules.disko
        ./modules/systems/disks.nix
        ./modules/configurations
      ];
    };
  };
}
