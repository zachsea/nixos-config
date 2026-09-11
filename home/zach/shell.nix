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
        # any manual config lines
      '';
    };

    zoxide.enable = true;
    atuin = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
