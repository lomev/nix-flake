{ pkgs, lib, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.stevenblack.enable = true;
  networking.stevenblack.block = [ "porn" "social" "gambling" ];
  networking.extraHosts = ''
    0.0.0.0 nitter.net
    0.0.0.0 www.nitter.net
    0.0.0.0 nitter.kavin.rocks
    0.0.0.0 www.nitter.kavin.rocks
    0.0.0.0 reddit.com
    0.0.0.0 www.reddit.com
    0.0.0.0 youtube.com
    0.0.0.0 www.youtube.com
    0.0.0.0 twitch.tv
    0.0.0.0 www.twitch.tv
    0.0.0.0 mangakakalot.com
    0.0.0.0 www.mangakakalot.com
    0.0.0.0 manganato.com
    0.0.0.0 www.manganato.com
    0.0.0.0 mangadex.org
    0.0.0.0 www.mangadex.org
    0.0.0.0 dynasty-scans.com
    0.0.0.0 www.dynasty-scans.com
    0.0.0.0 bato.to
    0.0.0.0 www.bato.to
    0.0.0.0 mangafire.to
    0.0.0.0 www.mangafire.to
  '';
}
