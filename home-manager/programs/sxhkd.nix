{ pkgs, ... }:
{
  services.sxhkd = {
    enable = true;
    extraOptions = [ "-m 1" ];
    keybindings = {
      # --- launch programs ---
      
      # program launcher
      "super + space" = "dmenu_run";
      # terminal
      "super + shift + Return" = "st";
      # emacs
      "super + t" = "emacs";
      # browser
      "super +  w" = "$BROWSER";
      # passmenu
      "super + p" = "passmenu";
      # clipmenu
      #"super + Insert" = "clipmenu";
      # youtube
      #"super + y" = "ytfzf -D -L | xargs ~/.local/bin/dmenu_open_url";

      # BSPWM HOTKEYS

      "super + {q,r}" = "bspc {quit,wm -r}";
      "super + shift + {1-9}" = "bspc node -d '^{1-9'";
      "super + {_shift + }c" = "bspc node -{c,k}";
      "super + {n,e,i,o}" = "bspc node -p {west,south,north,east}";
      "super + {t,shift + t,s,f}" = "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";

      
      # --- dwm ---
      
      # toggle bar
      #"super + b" = "dwmc togglebar";
      ## focus stack
      #"super + {n,e}" = "dwmc focusstack {+,-}1";
      ## rotate stack
      #"super + shift + {n,e}" = "dwmc {pushdown, pushup}";
      ## set mfact
      #"super + {h,i}" = "dwmc setmfact {-,+}0.05";
      ## view
      #"super + Tab" = "dwmc goback";
      ## transfer client to master or stack
      #"super + v " = "dwmc transfer";
      ## zoom
      #"super + Return" = "dwmc zoom";
      ## toggle floating
      #"super + backslash" = "dwmc togglefloating";
      ## toggle fullscreen
      #"super + f" = "dwmc togglefullscr";
      ## kill client
      #"super + q " = "dwmc killclient";
      ## show list of layouts
      ##"super + g" = "~/.local/bin/dmenu_layout";
      ## view all tags
      #"super + 0" = "dwmc viewall";
      ## tag all
      #"super + shift + 0" = "dwmc tagall";
      ## view tag; move client to diffrent tag
      #"super + {_,ctrl +}{_,shift +} {1-9}" = "dwmc {_,toggle}{viewex,tagex} {0-8}";
      ## change monitor
      #"super + {comma, period}" = "dwmc focusmon {-,+}1 ";
      ## move client to the other monitor
      #"super + shift + {comma, period}" = "dwmc tagmon {-,+}1 ";
      ## change gaps
      #"super + {equal,minus}" = "dwmc incrgaps {+,-}1";
      ## reset gaps
      #"super + shift + equal" = "dwmc defaultgaps";
      ## change gaps to default
      #"super + shift + minus" = "dwmc togglegaps";
      ## shift view to next tag
      #"super + bracketright" = "dwmc shiftview 1";
      ## shift view to prev tag
      #"super + bracketleft" = "dwmc shiftview -1";
      ## toggle scratchpads
      #"super + {s,r}" = "dwmc togglescratch {0,1}";
      ## update colorscheme
      ##"super + F5" = "xrdb -merge $HOME/.Xresources;";
      ## restart dwm
      #"super + shift + q" = "dwmc quit";
      ## quit dwm
      #"super + shift + BackSpace" = "killall xinit";
      
      # resize active window
      
      # -- dmenu ---
      
      # take a screenshot
      #"super + shift + s" = "~/.local/bin/dmenu_screenshot";
      ## mount a partition
      #"super + F1" = "~/.local/bin/dmenu_mount";
      ## umount a partition
      #"super + F2" = "/usr/local/bin/dmenu_umount";
      ## power options: shutdown, reboot etc.
      #"super + F9" = "~/.local/bin/dmenu_power";
      ## choose colorscheme
      #"super + F6" = "~/.local/bin/dmenu_colorscheme";
      ## play music with dmenu
      #"super + shift + m" = "~/.local/bin/dmenu_mpd";
      ## dmenu rss feed
      #"super + shift + n" = "~/.local/bin/dmenu_feed";
      ## add rss
      #"super + shift + r" = "~/.local/bin/dmenu_rss";
      
      # --- mpd & audio ---
      
      # play next/previous song
      "super + {XF86AudioNext,XF86AudioPrev}" = "mpc {next,prev} && pkill -RTMIN+18 dwmblocks";
      # pause playing song
      "super + XF86AudioPlay" = "mpc toggle && pkill -RTMIN+18 dwmblocks";
      # change volume
      "{XF86AudioRaiseVolume,XF86AudioLowerVolume}" = "pamixer -{i,d} 5 && pkill -RTMIN+22 dwmblocks";
      # mute volume
      "XF86AudioMute" = "pamixer -t && pkill -RTMIN+22 dwmblocks";
      
      # --- misc ---
             
      # restart sxhkd
      "super + Escape" = "pkill -USR1 -x sxhkd";
      # lockscreen
      #"super + shift + x" = "slock";
      #"super + F11" = "~/.local/bin/dmenu_power";
      #"super + F12" = "~/.local/bin/toggledock";
      #"super + z" = "~/.local/bin/trtoggle";
    };
  };
}
