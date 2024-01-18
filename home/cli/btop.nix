{ pkgs, inputs, outputs, ... }: {

  programs.btop = {
    enable = true;
    settings = {
      truecolor = true;
      graph_symbol = "brail";
      shown_boxes = "proc cpu mem gpu net";
      update_ms = 2000;
      proc_sorting = "cpu lazy";
      proc_mem_bytes = false;
      check_temp = true;
    };
  };
}
