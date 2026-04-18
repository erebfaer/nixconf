{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  services.broadcast-box = {
    enable = true;
    openFirewall = true;
  };
}
