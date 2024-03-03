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
    sxiv

    # dev tools
    android-tools
    python3
    python311Packages.pip
    
    calibre
    signal-desktop
    evolution
    pcmanfm

    pamixer
    pavucontrol
  ];
}
