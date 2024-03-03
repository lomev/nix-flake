{ pkgs, ... }:

{
  xsession.enable = true;  
  xsession.initExtra = ''
    dwmblocks &  
    xwallpaper --zoom /home/bart/nixos-config/wallpaper.jpg
  '';
}
