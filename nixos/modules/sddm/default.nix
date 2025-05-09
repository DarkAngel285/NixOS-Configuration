{ cursor-flavor, cursor-accent, ... }:
{
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    autoNumlock = true;
    settings = {
      Theme = {
        CursorTheme = "catppuccin-${cursor-flavor}-${cursor-accent}-cursors";
        CursorSize = 18;
      };
    };
    sugarCandyNix = {
      enable = true;
      settings = {
        Background = ./backgrounds/oshino-shinobu.png;
        ScreenWidth = 1920;
        ScreenHeight = 1080;
        FormPosition = "left";
        HaveFormBackground = true;
        PartialBlur = true;
      };
    };
  };
}
