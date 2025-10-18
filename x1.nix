# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [
    ./base.nix
  ];

  hardware.bluetooth.enable = true;

  services.xserver.displayManager.sessionCommands = ''
  # Example: disable a device, or set a property
  xinput --set-button-map 10 1 1 3 4 5 6 7
'';

  # Create an account for my partner
  users.users.am = {
    isNormalUser = true;
    description = "Amanda Carson";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
