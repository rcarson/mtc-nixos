# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

let
  stable = pkgs;
  unstable = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    #sha256 = "1i04bclcxsqhk172wvj74fcgk2sd7037mi9bgxp7jdx42886bl6h";
    sha256 = "15bmq6yx1sjjhlwq4b6sqzdifnsghwvh22fg6szp57xf97xivh6h";
  }) { config = { allowUnfree = true; }; };
in
{
  # Free Range Sudo
  security.sudo.wheelNeedsPassword = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with stable; [
    unstable.vscode
    obsidian
    discord-ptb
  ];
}
