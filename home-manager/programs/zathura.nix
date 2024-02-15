{ pkgs, ... }:
{
  programs.zathura = {
    enable = true;

    options = {
      statusbar-h-padding = "0";
      statusbar-v-padding = "0";
      page-padding = "1";
      selectioneclipboard = "clipboard";
    };

    mappings = {
      u = "scroll half-up";
      d = "scroll half-down";
      D = "toggle_page_mode";
      r = "reload";
      R = "rotate";
      n = "scroll down";
      e = "scroll up";
      h = "scroll left";
      i = "scroll right";
      N = "scroll full-down"; 
      E = "scroll full-up";
      k = "search";
      c = "recolor";
      p = "print";
    };
  };
}
