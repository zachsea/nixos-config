{
  programs.noctalia.settings.desktop_widgets = {
    schema_version = 2;
    widget_order = [
      "audio-viz"
      "clock-time"
      "clock-date"
    ];

    grid = {
      cell_size = 8;
      major_interval = 4;
      visible = true;
    };

    widget = {
      audio-viz = {
        box_height = 336.0;
        box_width = 1888.0;
        cx = 960.0;
        cy = 900.0;
        enabled = false;
        output = "DP-1";
        placement_height = 1080.0;
        placement_width = 1920.0;
        rotation = 0.0;
        type = "audio_visualizer";
        settings = {
          background = false;
          background_opacity = 0.0;
          bands = 124;
          color_1 = "secondary";
          mirrored = false;
          show_when_idle = true;
        };
      };

      clock-time = {
        box_height = 104.0;
        box_width = 368.0;
        cx = 232.0;
        cy = 120.0;
        output = "DP-1";
        placement_height = 1080.0;
        placement_width = 1920.0;
        rotation = 0.0;
        type = "clock";
        settings = {
          background = false;
          center_text = false;
          clock_style = "digital";
          format = "{:%l:%M %p}";
          shadow = false;
        };
      };

      clock-date = {
        box_height = 72.0;
        box_width = 384.0;
        cx = 250.0;
        cy = 192.0;
        output = "DP-1";
        placement_height = 1080.0;
        placement_width = 1920.0;
        rotation = 0.0;
        type = "clock";
        settings = {
          background = false;
          background_opacity = 0.0;
          center_text = false;
          format = "{:%d %B %Y}\\n{:%A}";
          shadow = false;
        };
      };
    };
  };
}
