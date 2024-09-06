{ pkgs, ... }:

{
  xsession.enable = false;  
  xsession.initExtra = ''
    dwmblocks &  
    xwallpaper --zoom /home/bart/nixos-config/wallpaper.jpg
  '';
}
