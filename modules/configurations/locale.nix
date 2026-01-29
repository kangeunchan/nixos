{ pkgs, ... }:

{
  time.timeZone = "Asia/Seoul";

  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "ter-v32n";
    packages = with pkgs; [ terminus_font ];
    keyMap = "us";
  };
}
