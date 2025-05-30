{pkgs, ...}: {
  # link shaders
  home.file.".config/mpv/shaders" = {
    source = ./shaders;
    recursive = true;
  };

  programs.mpv = {
    enable = true;

    bindings = {
      MBTN_MID = "script-binding uosc/menu";
      MBTN_RIGHT = "script-binding playlistmanager/showplaylist";
      MBTN_LEFT = "cycle pause";
      MBTN_LEFT_DBL = "cycle fullscreen";
      "x" = "set sub-delay 0";

      "/" = "script-binding uosc/keybinds";
    };

    config = {
      save-position-on-quit = "yes";
      keep-open = "yes";
      border = "yes";
      osc = "no";
      osd-bar = "no";

      # cache
      cache = "yes";
      # cache-secs = 300 # bigger cache
      demuxer-max-back-bytes = "20M";
      demuxer-max-bytes = "20M";

      # audio
      audio-channels = "stereo";
      audio-normalize-downmix = "yes";
      ad-lavc-downmix = "yes";
      alang = "jpn,jp,jap,Japanese,eng,en,enUS,en-US,English";
      audio-pitch-correction = "yes";

      # subtitles
      blend-subtitles = "no";
      slang = "forced,eng,en,enUS,en-US,English";

      # video
      profile = "gpu-hq";
      vo = "gpu-next";
      video-output-levels = "limited";
      deinterlace = "no";
      dither-depth = "auto";
      hwdec = "auto-safe";

      ## debanding
      deband = "yes";
      deband-iterations = 4;
      deband-threshold = 35;
      deband-range = 16;
      deband-grain = 4;

      ## antiring
      scale-antiring = 0.7;
      dscale-antiring = 0.7;
      cscale-antiring = 0.7;

      ## interpolation
      interpolation = "yes";
      tscale = "sphinx";
      tscale-blur = 0.6991556596428412;
      tscale-radius = 1.05;
      tscale-clamp = 0.0;

      ## SDR/HDR
      tone-mapping = "bt.2446a";

      ## Shaders, in order of sub-sections
      glsl-shaders = "~~/shaders/FSRCNNX_x2_8-0-4-1.glsl:~~/shaders/SSimDownscaler.glsl:~~/shaders/KrigBilateral.glsl";
      ### Luma up
      scale = "ewa_lanczos";
      ### Luma down
      dscale = "mitchell";
      ### Chroma up/down
      cscale = "ewa_lanczos";
      sigmoid-upscaling = "yes";
    };

    scripts = [
      pkgs.mpvScripts.mpv-playlistmanager
      pkgs.mpvScripts.thumbfast
      pkgs.mpvScripts.uosc
      pkgs.mpvScripts.mpris
    ];

    scriptOpts = {
      playlistmanager = {
        # does this break?
        dynamic_binds = "yes";
        key_moveup = "UP WHEEL_UP";
        key_movedown = "DOWN WHEEL_DOWN";
        key_playfile = "ENTER MBTN_LEFT";
        key_removefile = "BS MBTN_MID";
        key_closeplaylist = "ESC MBTN_RIGHT";

        playlist_display_timeout = 5;
        showamount = 28;

        style_ass_tags = "{\\fs10}";

        # TODO add %pos to the playlist file templates (sym %pos. %name)
      };

      uosc = {
        scale_fullscreen = 1.5; # post 5.0 scaling
        timeline_size = 20; # 5.0

        # 4.7 fullscreen scaling
        #timeline_size_max_fullscreen = 60;
        #controls_size_fullscreen = 64;
        #volume_size_fullscreen = 80;
        #menu_item_height_fullscreen = 72;
        #menu_min_width_fullscreen = 520;
        #top_bar_size_fullscreen = 40;
        # timeline_size_max = 20;

        # the rest

        timeline_persistency = "paused";
        # progress = "never"; # after 5.0
        click_threshold = 200;
        proximity_in = 10;
        proximity_out = 80;
        destination_time = "total";
        autohide = "yes";
      };
    };
  };
}
