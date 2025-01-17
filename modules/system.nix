{ pkgs, lib, self, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.joypixels.acceptLicense = true;
  #nixpkgs.config.packageOverrides = pkgs: { nur = import (self.inputs.nur) { inherit pkgs; }; };
  nixpkgs.overlays = [ (import self.inputs.emacs-overlay) ];

  nixpkgs.config.permittedInsecurePackages = [ 
    "qbittorrent-4.6.4" 
  ];

  systemd.targets = {
    "autologin-tty1" = {
      requires = [ "multi-user.target" ];
      after = [ "multi-user.target" ];
      unitConfig.AllowIsolate = "yes";
    };
  };

  systemd.services = {
    "autovt@tty1" = {
      enable = true;
      restartIfChanged = false;
      description = "autologin service at tty1";
      after = [ "suppress-kernel-logging.service" ];
      wantedBy = [ "autologin-tty1.target" ];
      serviceConfig = {
        ExecStart =  builtins.concatStringsSep " " ([
          "@${pkgs.utillinux}/sbin/agetty"
          "agetty --login-program ${pkgs.shadow}/bin/login"
          "--autologin bart --noclear %I $TERM"
        ]);
        Restart = "always";
        Type = "idle";
      };
    };
    "suppress-kernel-logging" = {
      enable = true;
      restartIfChanged = false;
      description = "suppress kernel logging to the console";
      after = [ "multi-user.target" ];
      wantedBy = [ "autologin-tty1.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.utillinux}/sbin/dmesg -n 1";
        Type = "oneshot";
      };
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    enable = true;
    earlySetup = true;
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # Enable the X11 windowing system.
  services = {
    printing = {
      enable = true;
      drivers = [ pkgs.zola pkgs.samsung-unified-linux-driver ];
    };

    openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
        PermitRootLogin = "no";
      };
    };

    keyd = {
      enable = true;
      keyboards = {
        default = {
          ids = ["*"];
          settings = {
            main = {
              capslock = "overload(control, esc)";
              rightalt = "oneshot(altgr)";
              control = "layer(nav)";
            };

            control = {
              n = "left";
              e = "down";
              i = "up";
              o = "right";
            };
          };
        };
      };
    };

    udisks2.enable = true;
  };

  security.polkit.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  
  # Enable OpenGL
  hardware.opengl.enable = true;

  # Load "nvidia" driver
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    #package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    #package = pkgs.bluez;
    #settings.Policy.AuteEnable = true;
  };

  services.blueman.enable = true;

  programs.zsh.enable = true;
  environment.shells = with pkgs; [ zsh ];

  users.users.bart = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    mononoki
    siji
    joypixels
    liberation_ttf
    mononoki
    iosevka
  ]; 

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # basic useful tools
    neovim
    usbutils
    rustup
    htop
    vscodium.fhs
    qbittorrent
    polybar
    lua54Packages.luarocks
    
    # yubikey
    yubikey-manager
    yubioath-flutter
    yubico-piv-tool
    yubikey-personalization
    pcsctools
    opensc

    (emacsWithPackagesFromUsePackage {
      config = ../init.el;
      defaultInitFile = true;
      package = pkgs.emacs-git;

      # Optionally provide extra packages not in the configuration file.
      extraEmacsPackages = epkgs: [
        epkgs.use-package
        epkgs.evil
        epkgs.evil-colemak-basics
      ];
    })
  ];

  services = { 
    udev.packages = with pkgs; [ yubikey-personalization ];
    yubikey-agent.enable = true;
    pcscd.enable = true;
  };

  programs.gnupg.agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-qt;
    enableSSHSupport = true;
  };

  programs.ssh.startAgent = false;
}

