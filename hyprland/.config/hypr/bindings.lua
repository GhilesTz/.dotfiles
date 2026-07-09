-- Application bindings
vim.g.terminal = "uwsm-app -- xdg-terminal-exec"
vim.g.browser = "omarchy-launch-browser"

-- Unbinds
unbind = {
  "SUPER CTRL, T",
  "SUPER CTRL, H",
  "SUPER, SPACE",
  "SUPER, P",
  "SUPER ALT, F4",
  "SUPER, H",
  "SUPER, L",
  "SUPER, K",
  "SUPER, J",
  "SUPER, LEFT",
  "SUPER, RIGHT",
  "SUPER, UP",
  "SUPER, DOWN",
  "SUPER SHIFT, N",
}

bind = {
  -- Application bindings
  { "SUPER ALT, RETURN, Tmux, exec, uwsm-app -- xdg-terminal-exec --dir=\"$(omarchy-cmd-terminal-cwd)\" tmux new" },
  { "SUPER, E, File manager, exec, thunar" },
  { "SUPER, R, Rnote, exec, uwsm-app -- rnote" },
  { "SUPER, B, Browser, exec, $browser" },
  { "SUPER SHIFT, M, Music, exec, omarchy-launch-or-focus spotify" },
  { "SUPER SHIFT ALT, M, Music TUI, exec, omarchy-launch-or-focus-tui cliamp" },
  { "SUPER SHIFT, N, Editor, exec, omarchy-launch-editor" },
  { "SUPER SHIFT, D, Docker, exec, omarchy-launch-tui lazydocker" },
  { "SUPER SHIFT, O, Obsidian, exec, omarchy-launch-or-focus \"^obsidian$\" \"uwsm-app -- obsidian\"" },
  -- { "SUPER SHIFT, SLASH, Passwords, exec, uwsm-app -- 1password" },
  { "SUPER ALT, C, Launch Calculator, exec, uwsm-app -- gnome-calculator" },

  -- If your web app url contains #, type it as ## to prevent hyprland treat it as comments
  { "SUPER SHIFT, A, ChatGPT, exec, omarchy-launch-webapp \"https://chatgpt.com\"" },
  { "SUPER SHIFT, B, Bluetooth, exec, omarchy-launch-tui bluetui" },
  { "SUPER SHIFT, T, Telegram, exec, uwsm-app -- Telegram" },
  { "SUPER SHIFT, W, Wifi, exec, omarchy-launch-tui impala" },
  { "SUPER SHIFT, C, Classroom, exec, omarchy-launch-webapp \"https://classroom.google.com/u/1/?authuser=1\"" },
  { "SUPER SHIFT, E, Email, exec, omarchy-launch-webapp \"https://mail.google.com/mail/u/0/##inbox\"" },
  { "SUPER ALT, E, Email (school), exec, omarchy-launch-webapp \"https://mail.google.com/mail/u/1/##inbox\"" },
  { "SUPER SHIFT, Y, YouTube, exec, omarchy-launch-webapp \"https://youtube.com/\"" },
  { "SUPER SHIFT, X, X, exec, omarchy-launch-webapp \"https://x.com/\"" },
  { "SUPER CTRL, T, Todo List, exec, xdg-terminal-exec --app-id=TUI.float -e $HOME/opt/todo" },
  { "SUPER CTRL, H, Manual, exec, xdg-terminal-exec --app-id=TUI.float batman" },
  { "SUPER CTRL, P, Open Notes, exec, xdg-terminal-exec --app-id=TUI.float vim \"/home/lone/notes/random.md\"" },

  { "SHIFT CTRL, PRINT, Color Picker, exec, hyprpicker | wl-copy" },
  { "SHIFT, PRINT, Print screen to clipboard, exec, omarchy-capture-screenshot smart copy" },
  { "SUPER, SUPER_L, Omarchy menu, exec, walker" },
  { "SUPER CTRL, G, Omarchy Projects, exec, ~/opt/git-projects-menu" },

  { "SUPER, P, Power Profiles, exec, omarchy-menu power" },

  -- Focus movement
  { "SUPER, H, exec, movefocus, l" },
  { "SUPER, L, exec, movefocus, r" },
  { "SUPER, K, exec, movefocus, u" },
  { "SUPER, J, exec, movefocus, d" },

  -- Window movement
  { "SUPER, LEFT, exec, movewindow, l" },
  { "SUPER, RIGHT, exec, movewindow, r" },
  { "SUPER, UP, exec, movewindow, u" },
  { "SUPER, DOWN, exec, movewindow, d" },

  { "SUPER SHIFT, h, exec, movewindow, l" },
  { "SUPER SHIFT, j, exec, movewindow, r" },
  { "SUPER SHIFT, k, exec, movewindow, u" },
  { "SUPER SHIFT, l, exec, movewindow, d" },

  { "SUPER, Q, Open Favorite Terminal, exec, $terminal" },
  { "SUPER CTRL, K, Show Keybinds, exec, omarchy-menu-keybindings" },
  { "SUPER, M, Toggle window split, layoutmsg, togglesplit" },
  { "SUPER SHIFT, N, Open Neovide, exec, neovide" },

  -- Workspace
  { "SUPER, S, Goto to Coding Workspace, workspace, 99" },
  { "SUPER SHIFT, S, Move Window to Scratchpad, movetoworkspace, 99" },

  -- Volume (commented out)
  -- { ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+" },
  -- { ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-" },
  -- { "ALT, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 1%+" },
  -- { "ALT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-" },
  -- { ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" },

  -- Media (commented out)
  -- { ", XF86AudioPlay, exec, playerctl play-pause" },
  -- { ", XF86AudioNext, exec, playerctl next" },
  -- { ", XF86AudioPrev, exec, playerctl previous" },

  { "SUPER, Pause, exec, hyprctl switchxkblayout all next" },
}

-- Binds settings
binds = {
  workspace_back_and_forth = true,
}
