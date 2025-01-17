{ pkgs, ... }:
{ 
  programs.mpv = {
    enable = true;
  
    package = (
      pkgs.mpv-unwrapped.wrapper {
        scripts = with pkgs.mpvScripts; [
          videoclip
        ];
      }
    );
  
    config = {
      profile = "high-quality";
      ytdl-format = "bestvideo+bestaudio";
      cache-default = 4000000;
    };
  };
}

