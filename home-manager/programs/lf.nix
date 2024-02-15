{ pkgs, ... }:
{ 
  programs.lf.enable = true;
  programs.lf.settings = {
    get-mime-type = "%xdg-mime query filetype \"$f\"";
    open = "$$OPENER $f";
  };

  programs.lf.previewer.source = "/home/bart/scope";
}

