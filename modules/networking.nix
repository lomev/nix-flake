{ pkgs, lib, ... }:

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall.enable = false;

  networking.stevenblack.enable = true;
  networking.stevenblack.block = [ "gambling" ];
}
