{
  programs.noctalia.settings.bar.default = {
    background_opacity = 0.6;
    center = [ "media" ];
    concave_edge_corners = false;
    end = [
      "tray"
      "notifications"
      "clipboard"
      "widget"
      "nix-monitor"
      "status"
      "volume"
      "input_volume"
      "group:g1"
    ];
    margin_ends = 10;
    radius_bottom_left = 20;
    radius_bottom_right = 20;
    radius_top_left = 0;
    radius_top_right = 0;
    shadow = false;
    start = [
      "file-search"
      "privacy"
      "workspaces"
    ];

    capsule_group = [
      {
        accordion = false;
        accordion_direction = "end";
        enabled = true;
        fill = "surface_variant";
        id = "g1";
        members = [
          "date"
          "clock"
        ];
        opacity = 0.0;
        padding = 0.0;
        widget_spacing = 4;
      }
    ];
  };
  programs.noctalia.settings.widget = {
    clock = {
      format = "{:%I:%M %p}";
    };
    file-search = {
      type = "nightwatch75/file-search:file-search";
    };
    media = {
      anchor = true;
      artist_first = true;
      hide_when_no_media = true;
    };
    nix-monitor = {
      show_text = false;
      type = "avivbintangaringga/nix-monitor:nix-monitor";
    };
    status = {
      type = "pozzoo/hassio:status";
    };
    widget = {
      type = "oldirtty/color_picker:widget";
    };
  };
}
