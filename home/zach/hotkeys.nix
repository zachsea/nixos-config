{ lib, ... }:
let
  lua = lib.generators.mkLuaInline;
  bind = key: action: {
    _args = [
      key
      (lua action)
    ];
  };
  bindf = key: action: flags: {
    _args = [
      key
      (lua action)
      flags
    ];
  };
  exec = cmd: ''hl.dsp.exec_cmd("${cmd}")'';
  focus = dir: ''hl.dsp.focus({ direction = "${dir}" })'';
  swap = dir: ''hl.dsp.window.move({ direction = "${dir}" })'';
  fs = mode: ''hl.dsp.window.fullscreen({ mode = "${mode}", action = "toggle" })'';
  # put this in a self contained file later
  toggleLayout = ''
    function()
      local layouts = { "dwindle", "scrolling" }
      local workspace = hl.get_active_special_workspace() or hl.get_active_workspace()
      if not workspace then return end
      local next_layout = layouts[1]
      for i = 1, #layouts do
        if layouts[i] == workspace.tiled_layout then
          next_layout = layouts[(i % #layouts) + 1]
          break
        end
      end
      if workspace.special then
        hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
      else
        hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
      end
    end
  '';
  # workspaces 1-9 + 0=10: switch / move+switch / move-only, per number
  wsBinds = lib.concatMap (
    i:
    let
      key = if i == 10 then "0" else toString i;
    in
    [
      (bind "SUPER + ${key}" "hl.dsp.focus({ workspace = ${toString i} })")
      (bind "SUPER + SHIFT + ${key}" "hl.dsp.window.move({ workspace = ${toString i} })") # moves and follows
      (bind "SUPER + CTRL + ${key}" "hl.dsp.window.move({ workspace = ${toString i}, follow = false })") # moves, stays put
    ]
  ) (lib.range 1 10);
in
{
  wayland.windowManager.hyprland.settings.bind = [

    (bind "SUPER + A" (exec "pwvucontrol")) # temp

    (bind "SUPER + SPACE" (exec "vicinae toggle"))

    # focus / swap by direction (hjkl)
    (bind "SUPER + H" (focus "left"))
    (bind "SUPER + J" (focus "down"))
    (bind "SUPER + K" (focus "up"))
    (bind "SUPER + L" (focus "right"))
    (bind "SUPER + SHIFT + H" (swap "left"))
    (bind "SUPER + SHIFT + J" (swap "down"))
    (bind "SUPER + SHIFT + K" (swap "up"))
    (bind "SUPER + SHIFT + L" (swap "right"))

    # layout, window state
    (bind "SUPER + F" (fs "fullscreen"))
    (bind "SUPER + SHIFT + F" (fs "maximized"))
    (bind "SUPER + CTRL + SPACE" ''hl.dsp.window.float({ action = "toggle" })'')
    (bind "SUPER + P" "hl.dsp.window.pin()")
    (bind "SUPER + Q" "hl.dsp.window.close()")
    (bind "SUPER + TAB" toggleLayout)

    # monitor / workspace-to-monitor
    (bind "SUPER + CTRL + S" ''hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "r" })'')
    (bind "SUPER + SHIFT + comma" ''hl.dsp.workspace.move({ monitor = "l" })'')
    (bind "SUPER + SHIFT + period" ''hl.dsp.workspace.move({ monitor = "r" })'')

    # mouse
    (bindf "SUPER + mouse:272" "hl.dsp.window.drag()" { mouse = true; })
    (bindf "SUPER + mouse:273" "hl.dsp.window.resize()" { mouse = true; })
    (bind "SUPER + mouse_down" ''hl.dsp.focus({ workspace = "e+1" })'')
    (bind "SUPER + mouse_up" ''hl.dsp.focus({ workspace = "e-1" })'')
  ]
  ++ wsBinds;

  programs.plasma = {
    enable = true;
    hotkeys.commands."vicinae" = {
      name = "Vicinae";
      key = "Meta+Space";
      command = "vicinae toggle";
    };
    shortcuts = {
      "services/plasma-manager-commands.desktop".vicinae = "Meta+Space";
    };

    spectacle = {
      shortcuts = {
        captureEntireDesktop = "Print";
        captureRectangularRegion = "Ctrl+Print";
        recordRegion = "Ctrl+Shift+Print";
      };
    };
  };
}
