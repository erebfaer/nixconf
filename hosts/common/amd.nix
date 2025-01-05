{
  pkgs,
  inputs,
  outputs,
  ...
}: {
  # imports = [./rocm-path.nix];
  # boot.initrd.kernelModules = ["amdgpu"];
  #services.xserver.videoDrivers = [ "amdgpu" ]; apparently default 'modesetting' is prefered
  #hardware.opengl = {
  #  driSupport = true;
  #  driSupport32Bit = true;
  #  enable = true;
  #  extraPackages = with pkgs; [
  #    rocm-opencl-icd
  #    rocm-opencl-runtime
  #  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu = {
      amdvlk = {
        enable = true;
        support32Bit.enable = true;
      };

      initrd.enable = true;
      opencl.enable = true;
    };
  };
}
