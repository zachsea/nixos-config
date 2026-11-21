{
  programs.ghostty = {
    enable = true;
    settings = {
      keybind = [
        "ctrl+shift+alt+c=copy_to_clipboard:vt"
      ];
    };
    enableZshIntegration = true;
  };
}
