{
  xdg = {
    terminal-exec = {
      enable = true;
      settings.default = [ "kitty.desktop" ];
    };
    mime = {
      defaultApplications = {
        "application/pdf" = "firefox.desktop";
        "image/png" = "feh.desktop";
        "image/gif" = "feh.desktop";
        "image/jpeg" = "feh.desktop";
      };
    };
  };
}
