{
  pkgs,
  ...
}:
{
  programs.ags = {
    enable = true;

    configDir = ./ags;

    extraPackages = with pkgs; [
      fzf
      ags-pkgs.hyprland
      ags-pkgs.mpris
    ];
  };
}
