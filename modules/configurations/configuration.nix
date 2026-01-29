{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "rkddmscks";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Seoul";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.rkddmscks = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
    curl
  ];

  console = {
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };

  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
    ];
    fontconfig.defaultFonts = {
      monospace = [ "JetBrainsMono Nerd Font" ];
      sansSerif = [ "Noto Sans CJK KR" ];
      serif = [ "Noto Serif" ];
    };
  };

  services.openssh.enable = true;

  system.stateVersion = "25.11";
}
