{
  programs.noctalia.settings.plugins.enabled = [
    "radimous/prismlauncher-instances"
  ];

  programs.noctalia.settings.plugin_settings."radimous/prismlauncher-instances" = {
    launcher_exec_command = "prismlauncher";
    prism_path = "/mnt/winc/Users/3zach/AppData/Roaming/.minecraft/MultiMC/Prism";
  };
}
