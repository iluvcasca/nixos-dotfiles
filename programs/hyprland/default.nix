  { config, pkgs, ... }:
  {
  
    home.packages = with pkgs; [
  #    waybar
      (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
      )
      dunst
      libnotify
      swww
    ];

    wayland.windowManager.hyprland = {
      enable = true;
      enableNvidiaPatches = true;
      extraConfig = with config.colorScheme.colors; ''

monitor=,preferred,auto,1




# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,24

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = false
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 9
    gaps_out = 15
    border_size = 3 
    col.active_border = 0xff${base0D}
    col.inactive_border = 0xff${base03}
    
    layout = dwindle
}
group {
    col.border_inactive = 0xff${base03}
    col.border_active = 0xff${base0E}

}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 0

    # blur {
    #     enabled = true
    #     size = 3
    #     passes = 1
    # }

    drop_shadow = true
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = 0xff11111b
}

animations {
    enabled = 1

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    # bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    #
    # animation = windows, 1, 7, myBezier
    # animation = windowsOut, 1, 7, default, popin 80%
    # animation = border, 1, 10, default
    # animation = borderangle, 1, 8, default
    # animation = fade, 1, 7, default
    # animation = workspaces, 1, 6, default
    bezier=overshot,0.13,0.99,0.29,1.1
    animation=windows,1,7,overshot,slide
    animation=border,1,10,default
    animation=fade,1,6,default
    animation=workspaces,1,6,overshot,slidevert
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = true # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_is_master = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = false
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#per-device-input-configs for more
device:epic-mouse-v1 {
    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, Q, exec, kitty
bind = $mainMod, C, killactive,
bind = $mainMod, M, exit,
bind = $mainMod, E, exec, dolphin
bind = $mainMod, V, togglefloating,
bind = $mainMod, R, exec, wofi --show drun
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, J, togglesplit, # dwindle

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow
bind = $mainMod,S,exec,rofi -show drun -show-icons

# Brightness
bind = ,XF86MonBrightnessUp, exec, brightnessctl set --min-value=50 10%+
bind = ,XF86MonBrightnessDown, exec, brightnessctl set --min-value=50 10%-

# Volume
bind = , Xf86AudioRaiseVolume, exec, amixer set Master 5%+
bind = , Xf86AudioLowerVolume, exec, amixer set Master 5%-
bind = , Xf86AudioMute, exec, amixer set Master toggle 

exec-once = bash ~/.config/home-manager/programs/hyprland/start.sh
'';
    };

  }
