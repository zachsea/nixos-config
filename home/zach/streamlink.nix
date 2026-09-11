{ pkgs, ... }:
{
  programs.streamlink = {
    enable = true;
    settings = {
      player = "${pkgs.mpv}/bin/mpv";
      default-stream = "best";
      ringbuffer-size = "32M";
      stream-segment-threads = 3;
      twitch-low-latency = true;
      twitch-supported-codecs = "h264,h265";
    };
  };
}
