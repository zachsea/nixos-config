{ pkgs, ... }:
{
  # shell programs for users
  programs.zsh.enable = true;

  users.users.zach = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
      "networkmanager"
    ];
    initialPassword = "changeme";
    shell = pkgs.zsh;
  };
  users.users.root.hashedPassword = "!";

  security.sudo.extraConfig = ''
    Defaults timestamp_timeout=30
  '';
}
