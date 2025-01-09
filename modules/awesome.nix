{ pkgs, lib, ... }:

{
  services = {
    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";

      #autoLogin = {
      #  enable = true;
      #  user = "bart";
      #};
    };

    xserver = {
      enable = true;
      displayManager.startx.enable = true;

      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
            luarocks
            luadbi-mysql
        ];
      };

      xkb.layout = "pl,pl";
      xkb.variant = ",colemak";
      xkb.options = "grp:shifts_toggle";

      autoRepeatDelay = 300;
      autoRepeatInterval = 50;

    };

    libinput = {
      enable = true;
      touchpad.disableWhileTyping = true;
    };
  };

  environment.systemPackages = with pkgs; [
    st
    dmenu
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
     dmenu = super.dmenu.overrideAttrs (oldAttrs: rec {
       src = pkgs.fetchFromGitHub {
         owner = "lomev";
         repo = "dmenu-new";
         rev = "0cedbda191443cf9588be40b17346742a5e8b041";
         hash = "sha256-RioC73Bu7h4nswIBfqDaRRfK3BhjXtpsyyRPv036Fjo=";
       };
     });
    })
  ];
}
