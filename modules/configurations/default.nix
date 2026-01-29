{ ... }:

{
  imports = [
    ./boot.nix
    ./networking.nix
    ./locale.nix
    ./users.nix
    ./packages.nix
    ./fonts.nix
    ./hyprland.nix
    ./services.nix
  ];

  system.stateVersion = "25.11";
}
