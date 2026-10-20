{
  programs.noctalia.settings.plugins.enabled = [
    "nuddel69/nightscout-monitor"
  ];
  programs.noctalia.settings.plugin_settings."nuddel69/nightscout-monitor" = {
    interval = 30;
    unit = "mg/dL";
  };
  # secrets defined by ../../../../../sops/fumo.yaml
}
