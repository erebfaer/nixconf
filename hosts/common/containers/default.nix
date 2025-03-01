# for all hosts
{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  # Enable common container config files in /etc/containers
  virtualisation.containers.enable = true;
  virtualisation = {
    podman = {
      enable = true;
      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;
      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  virtualisation.containers.storage.settings.storage.driver = "btrfs";

  # Allow non-root containers to access lower port numbers
  boot.kernel.sysctl."net.ipv4.ip_unprivileged_port_start" = 80;

  environment.systemPackages = with pkgs; [
    podman-compose
    compose2nix
  ];

  users.users.myuser = {
    isNormalUser = true;
    extraGroups = [ "podman" ];
  };
}
