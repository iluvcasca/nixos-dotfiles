{ config, pkgs, ... }: {
  programs.starship = with config.colorScheme.colors; {
    enable = true;
    enableNushellIntegration = true;
    settings = builtins.fromTOML ''
      format = """
      [](#${base0E})\
      $os\
      $username\
      [](bg:#${base0F} fg:#${base0E})\
      $directory\
      [](fg:#${base0F} bg:#${base09})\
      $git_branch\
      $git_status\
      [](fg:#${base09} bg:#${base0D})\
      $c\
      $elixir\
      $elm\
      $golang\
      $gradle\
      $haskell\
      $java\
      $julia\
      $nodejs\
      $nim\
      $rust\
      $scala\
      [](fg:#${base0D} bg:#06969A)\
      $docker_context\
      [](fg:#06969A bg:#${base0C})\
      $time\
      [ ](fg:#${base0C})\
      """

      # Disable the blank line at the start of the prompt
      # add_newline = false

      # You can also replace your username with a neat symbol like   or disable this
      # and use the os module below
      [username]
      show_always = true
      style_user = "bg:#${base0E}"
      style_root = "bg:#${base0E}"
      format = '[$user ]($style)'
      disabled = false

      # An alternative to the username module which displays a symbol that
      # represents the current operating system
      [os]
      style = "bg:#${base0E}"
      disabled = true # Disabled by default

      [directory]
      style = "bg:#${base0F}"
      format = "[ $path ]($style)"
      truncation_length = 3
      truncation_symbol = "…/"

      # Here is how you can shorten some long paths by text replacement
      # similar to mapped_locations in Oh My Posh:
      [directory.substitutions]
      "Documents" = "󰈙 "
      "Downloads" = " "
      "Music" = " "
      "Pictures" = " "
      # Keep in mind that the order matters. For example:
      # "Important Documents" = " 󰈙 "
      # will not be replaced, because "Documents" was already substituted before.
      # So either put "Important Documents" before "Documents" or use the substituted version:
      # "Important 󰈙 " = " 󰈙 "

      [c]
      symbol = " "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [docker_context]
      symbol = " "
      style = "bg:#${base0B}"
      format = '[ $symbol $context ]($style) $path'

      [elixir]
      symbol = " "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [elm]
      symbol = " "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [git_branch]
      symbol = ""
      style = "bg:#${base09}"
      format = '[ $symbol $branch ]($style)'

      [git_status]
      style = "bg:#${base09}"
      format = '[$all_status$ahead_behind ]($style)'

      [golang]
      symbol = " "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [gradle]
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [haskell]
      symbol = " "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [java]
      symbol = " "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [julia]
      symbol = " "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [nodejs]
      symbol = ""
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [nim]
      symbol = "󰆥 "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [rust]
      symbol = ""
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [scala]
      symbol = " "
      style = "bg:#${base0D}"
      format = '[ $symbol ($version) ]($style)'

      [time]
      disabled = false
      time_format = "%R" # Hour:Minute Format
      style = "bg:#${base0C}"
      format = '[ ♥ $time ]($style)'
    '';
  };
}
