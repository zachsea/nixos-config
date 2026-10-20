{ std, config, ... }:
{
  sops = {
    defaultSopsFile = ../../sops/fumo.yaml;
    age = {
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };
    secrets = {
      nightscout-api-url = {
        owner = "zach";
      };
      nightscout-api-key = {
        owner = "zach";
      };
      homeassistant-api-url = {
        owner = "zach";
      };
      homeassistant-api-key = {
        owner = "zach";
      };
    };
    templates."noctalia-hassio.toml" = {
      content = std.serde.toTOML {
        plugin_settings."pozzoo/hassio" = {
          ha_url = config.sops.placeholder.homeassistant-api-url;
          ha_token = config.sops.placeholder.homeassistant-api-key;
        };
      };
      path = "/home/zach/.config/noctalia/secrets-hassio.toml";
      owner = "zach";
      mode = "0400";
    };
    templates."noctalia-nightscout.toml" = {
      content = std.serde.toTOML {
        plugin_settings."nuddel69/nightscout-monitor" = {
          host = config.sops.placeholder.nightscout-api-url;
          api-secret = config.sops.placeholder.nightscout-api-key;
        };
      };
      path = "/home/zach/.config/noctalia/secrets-nightscout.toml";
      owner = "zach";
      mode = "0400";
    };
  };
}
