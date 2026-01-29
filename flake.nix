{
  description = "RKDDMSCKS NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachSystem [ "x86_64-linux" "aarch64-linux" ] (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        cfgName = "rkddmscks-${system}";
      in
      {
        nixosConfigurations.${cfgName} = pkgs.nixosSystem {
          inherit system;
          modules = [
            ./nixos/configuration.nix
          ];
        };
      });
}
