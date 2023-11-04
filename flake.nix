{
  description = "Home Manager configuration of iluvgriffith";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # source of Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    prism.url = "github:IogaMaster/prism";

    plugin-cellular-automaton.url = "github:Eandrju/cellular-automaton.nvim";
    plugin-cellular-automaton.flake = false;

    plugin-betterTerm-nvim.url = "github:CRAG666/betterTerm.nvim";
    plugin-betterTerm-nvim.flake = false;

    emacs-overlay.url = "github:nix-community/emacs-overlay";

  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."iluvgriffith" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./home.nix hyprland.homeManagerModules.default ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
          extraSpecialArgs = { inherit inputs; };
        };
    };
}
