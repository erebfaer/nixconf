{pkgs, ...}: {
  programs.zed-editor = {
    enable = true;

    userSettings = {
      features = {
        copilot = false;
      };
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
    };

    # TODO: configure theme, helix mode?

    extensions = [
      "nix"
      "everforest"
      "markdown-oxide"
    ];
  };
}
