# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  imports = [
    ./base.nix
  ];

  hardware.bluetooth.enable = true;

  # Create an account for my partner
  users.users.am = {
    isNormalUser = true;
    description = "Amanda Carson";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
