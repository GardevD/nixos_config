{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    # common modules across hosts
    ./homeManagerModules/bash.nix
    ./homeManagerModules/git.nix
    ./homeManagerModules/zoxide.nix
    ./homeManagerModules/eza.nix
    inputs.nixCats-lazyVim.homeModules.default
    # inputs.impermanence.homeManagerModules.impermanence
  ];

  nvim.enable = true;

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "dani";
  home.homeDirectory = "/home/dani";
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = [

  ];
}
