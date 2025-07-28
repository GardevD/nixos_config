{ ... }: {
  programs.eza = {
    enable = true;
    git = true;
    enableBashIntegration = true;
    icons = "always";

    extraOptions = [
      "--group-directories-first"
      "--binary"
      "--smart-group"
      "--grid"
    ];
  };
}
