{ inputs, ... }:
{
  services.flatpak.packages = [
    "org.vinegarhq.Sober"
    "com.github.tchx84.Flatseal"
  ];

  services.flatpak.overrides.settings."org.vinegarhq.Sober" = {
    Context.sockets = [ "wayland" ];
  };
}
