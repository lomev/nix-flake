{ config, ... }: let
  d = config.xdg.dataHome;
  c = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./zsh.nix
  ];

  home.sessionVariables = {
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = c + "/less/lesskey";
    
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "st";
  };

  home.shellAliases = {
    s = "sudo -Es";
    v = "nvim";
    sv = "sudo -Es nvim";
    upn= "sudo nixos-rebuild switch";
  };

  programs.less = {
    enable = true;
    keys = ''
      h    left-scroll
      l    left-scroll
      i    right-scroll
      n    forw-line
      N    forw-line-force
      e    back-line
      E    back-line-force
      k    repeat-search
      \ek  repeat-search-all
      K    reverse-search
      \eK  reverse-search-all 
    '';
  };
}
