{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # cli programs
    lf
    wget
    curl
    yt-dlp
    ytfzf
    qrencode
    pass
    neofetch
    xwallpaper
    buku
    fzf
    sfeed
    maim
    xclip
    toot
    newsboat
    unzip
    lm_sensors

    # gui
    surf
    tabbed
    qutebrowser
    komikku
    sxiv
    arandr
    calibre
    signal-desktop
    evolution
    pcmanfm
    telegram-desktop
    qbittorrent-nox
    prismlauncher
    krita
    gimp
    stellarium
    thunderbird

    # dev tools
    android-tools
    python3
    python311Packages.pip
    gcc
    git

    # sound
    pamixer
    pavucontrol

    # bluetooth
    bluez
    bluez-tools

    # anime
    trackma-curses
    anime-downloader
    adl
    mangal
    feh
  ];
}
