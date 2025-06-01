{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  virtualisation.libvirtd.enable = true;

  environment.systemPackages = with pkgs; [
    vagrant
  ];

  programs.virt-manager.enable = true;

  systemd.tmpfiles.rules = [ "L+ /var/lib/qemu/firmware - - - - ${pkgs.qemu}/share/qemu/firmware" ];
}
