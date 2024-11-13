{ pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    mpv
  ];

  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = [ self.mpvScripts.videoclip ];
      };
    })
  ];
}
