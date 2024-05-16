{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  # imports = [./rocm-path.nix];
  boot.initrd.kernelModules = ["amdgpu"];
  #services.xserver.videoDrivers = [ "amdgpu" ]; apparently default 'modesetting' is prefered
  hardware.opengl = {
    driSupport = true;
    driSupport32Bit = true;
    enable = true;
    extraPackages = with pkgs; [
      rocm-opencl-icd
      rocm-opencl-runtime
    ];
  };
}
