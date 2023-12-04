{ config, pkgs, inputs, self, ... }:

{

  imports = [
    ./shell
    ./programs
    ./modules
    inputs.nix-colors.homeManagerModules.default
    inputs.prism.homeModules.prism
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "kgriset";
  home.homeDirectory = "/home/kgriset";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.
  colorScheme = inputs.nix-colors.colorSchemes.kanagawa;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  programs.git = {
    enable = true;
    userEmail = "sntcillian@gmail.com";
    userName = "iluvcasca";
  };
  home.packages = with pkgs; [
    norminette
    cool-retro-term
    cmake
    gnumake
    llvmPackages_latest.libcxxClang
    libtool
    tree
    brightnessctl
    unzip
    jdk17
    ripgrep
    coreutils
    fd
    oneko
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/kgriset/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "nvim";
    # SHELL = "nushell";
  };
  fonts.fontconfig.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
  };

  nixpkgs.config.allowUnfree = true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
