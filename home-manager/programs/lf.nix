{ pkgs, ... }:
{ 
  programs.lf = { 
    enable = true;

    settings = {
      shell = "zsh";
      #shellopts = "-eu";
      #ifs = "\n";
      #scrolloff = 10;
      #number = true;
    };

    commands = {
      get-mime-type = "%xdg-mime query filetype \"$f\"";
      delete = ''
        set -f
        printf "$fx\n"
        printf "delete?[y/n]"
        read ans
        [ $ans = "y" ] && rm -rf $fx
      '';

      extract = ''
        set -f
        case $f in
          *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
          *.tar.gz|*.tgz) tar xzvf $f;;
          *.tar.xz|*.txz) tar xJvf $f;;
          *.zip) unzip $f;;
          *.rar) unrar x $f;;
          *.7z) 7z x $f;;
        esac
      '';

      dragon = "set -f; dragon $fx";
      tar = ''
        set -f
        mkdir $1
        cp -r $fx $1
        tar czf $1.tar.gz $1
        rm -rf $1
      '';

      zip = ''
        set -f
        mkdir $1
        cp -r $fx $1
        zip -r $1.zip $1
        rm -rf $1
      ''; 

      open = ''
        case $(file --mime-type "$(readlink -f $f)" -b) in
	      image/vnd.djvu|application/pdf|application/octet-stream|application/postscript) setsid -f zathura $fx >/dev/null 2>&1 ;;
          text/*) $EDITOR $fx;;
	      image/x-xcf) setsid -f gimp $f >/dev/null 2>&1 ;;
	      image/svg+xml) display -- $f ;;
	      image/*) sxiv $fx >/dev/null 2>&1 ;;
	      audio/*) mpv --audio-display=no $f ;;
	      video/*) setsid -f mpv $f -quiet >/dev/null 2>&1 ;;
	      application/pdf|application/vnd*|application/epub*) setsid -f zathura $fx >/dev/null 2>&1 ;;
	      application/pgp-encrypted) $EDITOR $fx ;;
            *) for f in $fx; do setsid -f $OPENER $f >/dev/null 2>&1; done;;
        esac
        }}
      '';
    };

    keybindings = {
      x = "$$f";
      X = "!$f";
      D = "trash";
      U = "!du -sh";
      gg = null;
      gh = "cd ~";
      o = "$mimeopen";
      O = "$mimeopen --ask $f";
      u = "open";

      h = "updir";
      n = "down";
      e = "up";
      i = "right";
      k = "search-next";
      K = "search-prev";
    };

    cmdKeybindings = {
    };

    #previewer.source = "/home/bart/scope";
    #previewer.keybinding = "i";
    #source = "/home/bart/cleaner";
  };
}

