{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_github";
      };
      "nas" = {
        hostname = "10.0.0.101";
        user = "zach";
        identityFile = "~/.ssh/id_nas";
      };
    };
  };
}
