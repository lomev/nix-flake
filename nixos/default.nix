{ config, pkgs, ... }:

{
  imports =
    [
      ../modules/system.nix
      ../modules/suckless.nix
      ../modules/networking.nix
      ../modules/steam.nix

      ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    initrd.luks.devices = {
      cryptlvm = {
        device = "/dev/disk/by-partuuid/3f2b48cd-0c2a-9b46-8fef-93a2086ad1a2";
        allowDiscards = true;
        preLVM = true;
      };
    };
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It's perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}

