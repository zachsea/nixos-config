{
  # plugin requirements

  programs.noctalia = {
    enable = true;
    settings = {
      location = {
        address = "Seattle, WA";
      };

      plugins = {
        enabled = [
          "oldirtty/color_picker"
          "gustav0ar/drive-health"
          "nightwatch75/file-search"
          "pozzoo/hassio"
          "avivbintangaringga/nix-monitor"
          "tordex/nvtop"
          "radimous/prismlauncher-instances"
          "cleboost/ssh-launcher"
          "rylos/tailnet"
        ];
        auto_update = "none";
      };

      shell = {
        screenshot = {
          save_to_file = true;
          directory = "/mnt/winc/Users/3zach/Documents/ShareX/Screenshots";
          filename_pattern = "%Y-%m/%m-%d-%Y_%H-%M-%S";
          copy_to_clipboard = true;
          freeze_screen = true;
        };
      };

      theme = {
        mode = "dark";
        shell_mode = "follow";
        source = "builtin";
        builtin = "Tokyo-Night";
      };

      wallpaper = {
        enabled = true;

        transition_on_startup = true;

        default = {
          path = ../../../assets/wallpaper.png;
        };
      };

      weather = {
        enabled = true;
        refresh_minutes = 10;
        unit = "imperial";
        effects = true;
      };
    };
  };
}
