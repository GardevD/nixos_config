{pkgs, ...}:
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;

  # Configure console keymap
  console.keyMap = "hu";


  # Set your time zone.
  time.timeZone = "Europe/Budapest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "hu_HU.UTF-8";
    LC_IDENTIFICATION = "hu_HU.UTF-8";
    LC_MEASUREMENT = "hu_HU.UTF-8";
    LC_MONETARY = "hu_HU.UTF-8";
    LC_NAME = "hu_HU.UTF-8";
    LC_NUMERIC = "hu_HU.UTF-8";
    LC_PAPER = "hu_HU.UTF-8";
    LC_TELEPHONE = "hu_HU.UTF-8";
    LC_TIME = "C.UTF-8";
  };

  #use content adressing and hardlinks to store duplicates once
  nix.optimise.automatic = true;
  # Allow unfree packages
  nixpkgs.config={
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  fonts.packages = with pkgs; [
    # needed for lazygit
    font-awesome
    nerd-fonts.mononoki
    # for winter theme setup on hyprland
    # nerd-fonts.fira-code
    # terminus-nerdfont
  ];

  environment.systemPackages = with pkgs; [
    ripgrep
    uutils-coreutils-noprefix
  ];
}
