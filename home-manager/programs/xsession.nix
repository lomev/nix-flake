{ pkgs, ... }:

{
  xsession.enable = true;  
  xsession.initExtra = ''
    dwmblocks &  
    xwallpaper --zoom ~/nixos-config/wallpaper.jpg
  '';
}
