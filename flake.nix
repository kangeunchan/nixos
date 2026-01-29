{
  description = "RKDDMSCKS NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, flake-utils, disko, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        cfgName = "rkddmscks-${system}";
      in
      {
        nixosConfigurations.${cfgName} = pkgs.nixosSystem {
          inherit system;
          modules = [
            disko.nixosModules.disko
            ./modules/systems/disks.nix
            ./modules/configurations/configuration.nix
          ];
        };
      });
}
