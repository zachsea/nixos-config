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
  };
}
