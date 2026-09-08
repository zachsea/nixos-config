{
  programs.plasma = {
    enable = true;
    hotkeys.commands."vicinae" = {
      name = "Vicinae";
      key = "Meta+Space";
      command = "vicinae toggle";
    };
    shortcuts = {
      "services/plasma-manager-commands.desktop".vicinae = "Meta+Space";
    };

    spectacle = {
      shortcuts = {
        captureEntireDesktop = "Print";
        captureRectangularRegion = "Ctrl+Print";
        recordRegion = "Ctrl+Shift+Print";
      };
    };
  };
}
