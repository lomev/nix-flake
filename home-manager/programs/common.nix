{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    gcc
    yt-dlp
    ytfzf
    qrencode
    pass
    buku
    fzf
    sfeed
    mpv
    maim
    xclip
    arandr
    
    calibre
    signal-desktop
    evolution
    pcmanfm

    pamixer
    pavucontrol
  ];
}
