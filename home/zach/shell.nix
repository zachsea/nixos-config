{
  imports = [
    ./starship.nix
  ];
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      history = {
        size = 50000;
        save = 50000;
        path = "$HOME/.local/share/zsh/history";
        ignoreDups = true;
        ignoreAllDups = true;
        ignorePatterns = [
          "rm -rf *"
          "pkill *"
        ];
        share = true;
      };

      shellAliases = {
        ll = "ls -alh";
        update = "sudo nixos-rebuild switch --flake .#fumo";
      };

      initContent = ''
        twitch() {
          if [ -z "$1" ]; then echo "Usage: twitch <username>"; return 1; fi
          setsid streamlink "twitch.tv/$1" >/dev/null 2>&1 &
          disown
          setsid chatterino --channels "$1" >/dev/null 2>&1 &
          disown
        }
      '';
    };

    zoxide.enable = true;
    atuin = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
