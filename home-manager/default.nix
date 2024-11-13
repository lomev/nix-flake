{ config, pkgs, ... }:

{
  imports = 
    [
      ./programs
      ./shell
    ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "bart";
  home.homeDirectory = "/home/bart";

  services.unclutter.enable = true;
  #services.picom.enable = true;
  services.dunst.enable = true;
  services.mpd.musicDirectory = "/home/bart/Music";
  services.syncthing.enable = true;

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium.fhs;
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
