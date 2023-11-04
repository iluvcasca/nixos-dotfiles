{config, pkgs, ...}:
{
  programs.kitty = with config.colorScheme.colors; {
    enable = true;
    font.name = "FiraCode Nerd Font Mono";
    settings = {
      background_opacity = "0.7";
      background = "#${base00}";
      foreground = "#${base05}";
      selection_foreground = "#${base06}";
      cursor = "#${base06}";
      active_tab_background = "#${base00}";
      active_tab_foreground = "#${base06}";
      inactive_tab_background = "#${base00}";
      inactive_tab_foreground = "#${base04}";

      color0 = "#${base01}";
      color1 = "#${base08}";
      color2 = "#${base0B}";
      color3 = "#${base0A}";
      color4 = "#${base0D}";
      color5 = "#${base0E}";
      color6 = "#${base0C}";
      color7 = "#${base06}";
      color8 = "#${base04}";
      color9 = "#${base0F}";
      color10 = "#${base0C}";
      color11 = "#${base0D}";
      color12 = "#${base0E}";
      color13 = "#${base0F}"; 
      color15 = "#${base05}";
      color16 = "#${base09}";
        
    }; 
    };
  }
