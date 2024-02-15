{
  description = "bart's NixOS Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    nur.url = "github:nix-community/NUR";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:nix-community/emacs-overlay/9327b7e16a991c8a2efbad729ac28452d7c40bf0";
  };

  outputs = { self, nixpkgs, nur, home-manager, emacs-overlay, ... }@inputs: {
    nixosConfigurations = {
      "nixos-test" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = inputs;
        modules = [
          ./nixos/default.nix
          ./nixos/hardware-configuration.nix
          #nur.nixosModules.nur
          { nixpkgs.overlays = [ nur.overlay ]; }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bart = import ./home-manager/default.nix;
          }
        ];
      };
    };
  };
}
