{ pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;
      autorun = false;

      xkb.layout = "pl";
      xkb.variant = "colemak";
      autoRepeatDelay = 300;
      autoRepeatInterval = 50;

      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    libinput = {
      enable = true;
      touchpad.disableWhileTyping = true;
    };
  };
}
