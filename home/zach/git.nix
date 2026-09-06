{
  programs.git = {
    enable = true;
    settings = {
      user.name = "zachsea";
      user.email = "zachse4@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = true;
      core.editor = "vim";
    };
  };
}
