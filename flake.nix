{
  description = "Home Manager configuration of kgriset";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # source of Hyprland
    #hyprland.url = "github:hyprwm/Hyprland";
    nix-colors.url = "github:misterio77/nix-colors";
    prism.url = "github:IogaMaster/prism";

    plugin-cellular-automaton.url = "github:Eandrju/cellular-automaton.nvim";
    plugin-cellular-automaton.flake = false;

    plugin-betterTerm-nvim.url = "github:CRAG666/betterTerm.nvim";
    plugin-betterTerm-nvim.flake = false;

    emacs-overlay.url = "github:nix-community/emacs-overlay";
    plugin-header_42_vim.url = "github:42Paris/42header";
    plugin-header_42_vim.flake = false;

    plugin-norminette-vim.url = "github:alexandregv/norminette-vim";
    plugin-norminette-vim.flake = false;
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."kgriset" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit inputs; };
      };
    };
}
