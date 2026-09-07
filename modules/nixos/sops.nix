{ config, ... }:
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
    };
    templates = {
      "vicinae-secrets.json" = {
        owner = "zach";
        content = builtins.toJSON {
          providers = {
            "@zachsea/nightscout" = {
              preferences = {
                instance = config.sops.placeholder.nightscout-api-url;
                token = config.sops.placeholder.nightscout-api-key;
              };
            };
          };
        };
      };
    };
  };
}
