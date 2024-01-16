# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
flake-overlays:

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

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
    LC_TIME = "hu_HU.UTF-8";
  };


  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  #hyperland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    #If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    #Hint electron apps to use wayland
    #When I had it on electron apps didn't work
    #NIXOS_OZONE_WL = "1";
  };


  xdg.portal.enable = true;
  #xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Configure keymap in X11
  services.xserver = {
    layout = "hu,dk";
    xkbVariant = "nodeadkeys";
    xkbOptions = "grp:alt_shift_toggle";
  };

  # Configure console keymap
  console.keyMap = "dk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  boot.supportedFilesystems = [ "zfs" "ntfs"];
  programs.steam.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = false;

  nixpkgs.overlays = [
    (
      final: prev: {
        # Your own overlays...
      }
    )
  ] ++ flake-overlays;

  users.users.dani = {
    isNormalUser = true;
    description = "Gardev Dániel";
    initialHashedPassword = "$y$j9T$eB1piEmD1KMDq6r1ShZXR/$1vFOtpbzwEWD.xPikpLnyacVSLHmU2Sa6vbrvgTt84/";
    hashedPassword = "$y$j9T$eB1piEmD1KMDq6r1ShZXR/$1vFOtpbzwEWD.xPikpLnyacVSLHmU2Sa6vbrvgTt84/";
    extraGroups = [ "networkmanager" "wheel" "vboxusers" "user-with-access-to-virtualbox"];
    packages = with pkgs; [
      anki
      lutris
      openjdk17
      steam
      vscodium
      vscode
      discord
      keepassxc
      dotnet-sdk_8
      blender
      matlab
      kicad
      krita
      imagemagick
      adoptopenjdk-icedtea-web #javaws is needed for exam monitor SDU
      wine
    #  thunderbird
    ];
  };

  home-manager.users.dani = import ./home.nix;


  # Allow unfree packages
  nixpkgs.config={
	allowUnfree = true;
	allowUnfreePredicate = (_: true);
  };
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.guest.enable = true;
  nixpkgs.config.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "user-with-access-to-virtualbox" ];


  nix.settings.experimental-features = [ "nix-command" "flakes"];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget


  environment.systemPackages = with pkgs; [
      dunst
      git
      kitty
      python3
      rofi-wayland
      swww
      vim
      vivaldi
      waybar
      #waybar workspaces display fix:
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
  )
    ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

}
