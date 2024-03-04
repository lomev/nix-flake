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

  environment.systemPackages = with pkgs; [
    st
    dmenu
    dwmblocks
  ];

  nixpkgs.overlays = [
    (self: super: {
      dwm = super.dwm.overrideAttrs (oldAttrs: rec {
        buildInputs = oldAttrs.buildInputs ++ [ pkgs.imlib2 pkgs.picom ];
        src = pkgs.fetchFromGitHub {
          owner = "lomev";
          repo = "dwm-new";
          rev = "1faac2eb94c6fa4863c2ef4ea0758bcad7f4dd45";
          hash = "sha256-fX9Bxgr0lcSaQvDNu6A9rIRaKUMI6yj+s6HKjyAOMhc=";
        };
      });
    })

    (self: super: {
      st = super.st.overrideAttrs (oldAttrs: rec {
        src = pkgs.fetchFromGitHub {
          owner = "lomev";
          repo = "st-new";
          rev = "4abe01b5858937a42279b056cf63ba95d01a7793";
          hash = "sha256-thY1qhuOK/jo+cBq7cN/MOfeYvrpi2bO1GyU4t80Cjc=";
        };
      });
    })

    (self: super: {
      dwmblocks = super.dwmblocks.overrideAttrs (oldAttrs: rec {
        src = pkgs.fetchFromGitHub {
          owner = "lomev";
          repo = "dwmblocks.new";
          rev = "0898beb8a09f27818cedb3b7cbf5920e215a956c";
          hash = "sha256-oq6kSGhxsaBiFwJKfcCxAi3wEHrOkteQvUMlabn/Kus=";
        };
      });
    })

    #(self: super: {
    #  dmenu = super.dmenu.overrideAttrs (oldAttrs: rec {
    #    src = /home/bart/code/dmenu;
    #  });
    #})
  ];
}
