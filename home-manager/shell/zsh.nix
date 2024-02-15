{ pkgs, config, ... }:

{
  programs.zsh = {
    enable = true;
    
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
    
    #shellAliases = {
    #  s = "sudo -Es";
    #  v = "nvim";
    #  sv = "sudo -Es nvim";
    #  edn = "sv /etc/nixos/configuration.nix";
    #  edh = "v ~/.config/home-manager/home.nix";
    #  upn= "sudo nixos-rebuild switch";
    #  uph= "home-manager switch";
    #};

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    initExtra = ''
      # Basic auto/tab complete
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit

      # include hidden files
      _comp_options+=(globdots)

      # vi mode
      bindkey -v
      
      # use vim keys in tab complete menu (hjkl -> hnei)
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'n' vi-down-line-or-history
      bindkey -M menuselect 'e' vi-up-line-or-history
      bindkey -M menuselect 'i' vi-forward-char

      # ctrl-j newline
      bindkey '^n' accept-line
      bindkey -a '^n' accept-line
      
      # basic movement in vi mode (hjkl -> hnei)
      bindkey -a 'n' down-line-or-history
      bindkey -a 'e' up-line-or-history
      bindkey -a 'i' vi-forward-char
      
      # remap the rest of keybindings
      bindkey -a 'k' vi-repeat-search
      bindkey -a 'K' vi-rev-repeat-search
      bindkey -a 'u' vi-insert
      bindkey -a 'U' vi-insert-bol
      bindkey -a 'l' vi-undo-change
      bindkey -a 'N' vi-join

      # spare
      bindkey -a 'j' vi-forward-word-end
      bindkey -a 'J' vi-forward-blank-word-end
      '';
  };
}
