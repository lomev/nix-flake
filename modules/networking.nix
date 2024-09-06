{ pkgs, lib, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall.enable = false;

  networking.stevenblack.enable = true;
  networking.stevenblack.block = [ "porn" "gambling" ];
  networking.extraHosts = ''
    0.0.0.0 nitter.net
    0.0.0.0 www.nitter.net
    0.0.0.0 nitter.kavin.rocks
    0.0.0.0 www.nitter.kavin.rocks
    0.0.0.0 twitch.tv
    0.0.0.0 www.twitch.tv
    0.0.0.0 mangafire.to
    0.0.0.0 www.mangafire.to
    0.0.0.0 manganato.com
    0.0.0.0 www.manganato.com
  '';
}
