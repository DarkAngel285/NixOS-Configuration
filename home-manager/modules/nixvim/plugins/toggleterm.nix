{
  programs.nixvim.plugins.toggleterm = {
    enable = true;
    settings = {
      size = 10;
      open_mapping = "[[<C-\\>]]";
      hide_numbers = true;
      shade_filetypes = [];
      shade_terminals = true;
      shading_factor = 2;
      start_in_insert = true;
      insert_mappings = true;
      persist_size = true;
      direction = "float";
      close_on_exit = true;
      float_opts = {
        border = "curved";
        winblend = 0;
        highlights = {
          border = "Normal";
          background = "Normal";
        };
      };
    };
  };
}
