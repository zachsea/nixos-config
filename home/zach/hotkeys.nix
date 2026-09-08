{
  programs.plasma = {
    enable = true;
    hotkeys.commands = {
      "vicinae" = {
        name = "Vicinae";
        key = "Meta+Space";
        command = "vicinae toggle";
      };
      "flameshot-gui" = {
        name = "Flameshot Capture";
        key = "Ctrl+Print";
        command = "flameshot gui";
      };
    };
    shortcuts = {
      "services/plasma-manager-commands.desktop".vicinae = "Meta+Space";
      "services/plasma-manager-commands.desktop"."flameshot-gui" = "Ctrl+Print";
    };
  };
}
