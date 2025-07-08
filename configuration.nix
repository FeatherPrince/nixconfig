# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, programs, ... }:

let
#  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz";
   home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in

{
  imports =
  [ # Include the results of the hardware scan.
    ./display-server/x11/i3.nix
    ./hardware-configuration.nix
    ./package-list.nix
    ./drivers.nix
    ./polkit.nix
    #./plymouth.nix
    (import "${home-manager}/nixos")
  ];

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    backupFileExtension = "backup";
    users.feather = import ./home.nix;
  };

 services.displayManager.ly = {
   enable = true;
 };

  nix.settings.experimental-features = "nix-command flakes";

  fonts.fontconfig.useEmbeddedBitmaps = true;

  boot.loader.grub = { 
    enable = true;
    device = "/dev/sdb";
    useOSProber = true;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "pl";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "pl2";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.feather = {
      isNormalUser = true;
      description = "Feather";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [];
  };

##########
# Programs
#services.dunst.enable = true;
programs.fish.enable = true;
programs.noisetorch.enable = true;
programs.dconf.enable = true;
programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
};

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

services.devmon.enable = true;
services.gvfs.enable = true;
services.udisks2.enable = true;

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
  system.stateVersion = "24.11"; # Did you read the comment?




#  ####################################################
#  # Configuring Nvidia PRIME
#  hardware.nvidia.nvidiaSettings = true;
#  services.xserver.videoDrivers = ["nvidia"];
#  hardware.opengl.enable = true;
#  hardware.nvidia.modesetting.enable = true;
#  hardware.nvidia.prime = {
#   offload.enable = true;
#
#   # Bus ID of the NVIDIA GPU. You can find it using lspci, either under 3D or VGA
#   nvidiaBusId = "PCI:1:0:0";
#
#   # Bus ID of the Intel GPU. You can find it using lspci, either under 3D or VGA
#   intelBusId = "PCI:0:2:0";
#  };
#  hardware.opengl.driSupport32Bit = true;
#  hardware.nvidia.powerManagement.enable = true;
#  
#  # Optionally, you may need to select the appropriate driver version for your specific GPU.
}
