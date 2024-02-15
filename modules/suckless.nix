{ pkgs, lib, ... }:

{
  services = {
    xserver = {
      enable = true;

      layout = "pl";
      xkbVariant = "colemak";
      autoRepeatDelay = 300;
      autoRepeatInterval = 50;

      displayManager.startx.enable = true;
      windowManager.dwm.enable = true;

      libinput = {
        enable = true;
        touchpad.disableWhileTyping = true;
      };
    };
  };

  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
        buildInputs = oldAttrs.buildInputs ++ [ pkgs.imlib2 pkgs.picom ];
        src = /home/bart/code/dwm;
      });
    })

    (self: super: {
      dwm = super.st.overrideAttrs (oldAttrs: rec {
        src = /home/bart/code/st;
      });
    })

    (self: super: {
      dwm = super.dmenu.overrideAttrs (oldAttrs: rec {
        src = /home/bart/code/dmenu;
      });
    })
  ];
}
