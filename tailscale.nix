# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    tailscale
  ];

  # service
  services.tailscale.enable = true;

  ## create a oneshot job to authenticate to Tailscale
  #systemd.services.tailscale-autoconnect = {
  #  description = "Automatic connection to Tailscale";

  #  # make sure tailscale is running before trying to connect to tailscale
  #  after = [ "network-pre.target" "tailscale.service" ];
  #  wants = [ "network-pre.target" "tailscale.service" ];
  #  wantedBy = [ "multi-user.target" ];

  #  # set this service as a oneshot job
  #  serviceConfig.Type = "oneshot";

  #  # have the job run this shell script
  #  script = with pkgs; ''
  #    # wait for tailscaled to settle
  #    sleep 2

  #    # check if we are already authenticated to tailscale
  #    status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
  #    if [ $status = "Running" ]; then # if so, then do nothing
  #      exit 0
  #    fi

  #    # otherwise authenticate with tailscale
  #    ${tailscale}/bin/tailscale up -authkey <your-auth-key>
  #  '';
  #};

}
