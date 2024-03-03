{ pkgs, lib, self, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  virtualisation.docker.enable = true;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.joypixels.acceptLicense = true;
  #nixpkgs.config.packageOverrides = pkgs: { nur = import (self.inputs.nur) { inherit pkgs; }; };
  nixpkgs.overlays = [ (import self.inputs.emacs-overlay) ];

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
              esc = "capslock";
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

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

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
  ]; 

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # basic useful tools
    neovim
    wget
    curl
    git
    lf
    neofetch
    xwallpaper

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
    pinentryFlavor = "qt";
    enableSSHSupport = true;
  };

  programs.ssh.startAgent = false;
}

