{
  programs.noctalia.settings.plugins.enabled = [
    "pozzoo/hassio"
  ];
  programs.noctalia.settings.plugin_settings."pozzoo/hassio" = {
    entity_manager_open_near_click = true;
    entity_manager_placement = "attached";
    shortcut_entity_1 = "switch.living_room_console_power_strip_switch_4";
  };
  # secrets defined by ../../../../../sops/fumo.yaml
}
