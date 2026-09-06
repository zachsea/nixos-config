{ ... }:
{
  users.users.zach = {
    isNormalUser = true;
    extraGroups = [ "wheel" "input" "networkmanager" ];
    initialPassword = "changeme";
  };
  users.users.root.hashedPassword = "!";

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=30
  '';
}
