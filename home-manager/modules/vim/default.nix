{ pkgs, flavor, ... }:
{
  home.packages = with pkgs; [
    nil
    nixfmt-rfc-style
    clang-tools
    jdk

    ctags
  ];

  programs.vim = {
    enable = true;

    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      nerdtree
      nerdtree-git-plugin
      vim-nerdtree-syntax-highlight
      vim-devicons
      vim-airline
      vim-gitgutter
      ctrlp-vim
      vim-tmux-navigator
      vim-surround
      nerdcommenter
      tagbar
      coc-nvim
      coc-pairs
      coc-snippets
      coc-highlight
      coc-clangd
      coc-java
      coc-json
      vim-wayland-clipboard
      catppuccin-vim
    ];

    extraConfig = ''
      colorscheme catppuccin_${flavor}
      let g:airline_theme='catppuccin_${flavor}'

      ${builtins.readFile ./config.vim}
    '';
  };

  xdg.configFile = {
    "vim/coc-settings.json".text = ''
      {
        "languageserver": {
          "nix": {
            "command": "nil",
            "filetypes": ["nix"],
            "rootPatterns":  ["flake.nix"],
            "settings": {
              "nil": {
                "formatting": { "command": ["nixfmt"] }
              }
            }
          }
        }
      }
    '';
  };
}
