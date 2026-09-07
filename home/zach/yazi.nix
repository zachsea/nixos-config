{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    flavors = {
      tokyo-night = pkgs.fetchFromGitHub {
        owner = "BennyOe";
        repo = "tokyo-night.yazi";
        rev = "main";
        sha256 = "sha256-LArhRteD7OQRBguV1n13gb5jkl90sOxShkDzgEf3PA0=";
      };
    };
    theme.flavor.dark = "tokyo-night";
  };
}

