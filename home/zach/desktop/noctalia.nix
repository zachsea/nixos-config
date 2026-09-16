{
  programs.noctalia = {
    enable = true;
    settings = {
      theme = {
        mode = "dark";
        shell_mode = "follow";
        source = "builtin";
        builtin = "Tokyo-Night";
      };
      wallpaper = {
        enabled = true;
        default.path = ../../../assets/wallpaper.png;
      };
    };
  };
}
