local wezterm = require 'wezterm';
return {
    default_prog = {"/usr/bin/zsh", "-l"},
    keys = {
        -- Create a new tab in the same domain as the current tab
        {key="t", mods="CTRL", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
        -- Create a new tab in the default domain
        {key="t", mods="ALT", action=wezterm.action{SpawnTab="DefaultDomain"}},
        -- move tabs
        {key="LeftArrow", mods="CTRL", action=wezterm.action{MoveTabRelative=-1}},
        {key="RightArrow", mods="CTRL", action=wezterm.action{MoveTabRelative=1}},
        -- move focus between tabs
            {key="LeftArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=-1}},
        {key="RightArrow", mods="ALT", action=wezterm.action{ActivateTabRelative=1}},
        {key="1", mods="ALT", action=wezterm.action{ActivateTab=0}},
        {key="2", mods="ALT", action=wezterm.action{ActivateTab=1}},
        {key="3", mods="ALT", action=wezterm.action{ActivateTab=2}},
        {key="4", mods="ALT", action=wezterm.action{ActivateTab=3}},
        {key="5", mods="ALT", action=wezterm.action{ActivateTab=4}},
        {key="6", mods="ALT", action=wezterm.action{ActivateTab=5}},
        {key="7", mods="ALT", action=wezterm.action{ActivateTab=6}},
        {key="8", mods="ALT", action=wezterm.action{ActivateTab=7}},
        {key="9", mods="ALT", action=wezterm.action{ActivateTab=8}},
        {key="0", mods="ALT", action=wezterm.action{ActivateTab=-1}},
    },
    adjust_window_size_when_changing_font_size = false,
    colors = {
        tab_bar = {

            -- The color of the strip that goes along the top of the window
            background = "#262626",

            -- The active tab is the one that has focus in the window
            active_tab = {
                -- The color of the background area for the tab
                bg_color = "#404040",
                -- The color of the text for the tab
                fg_color = "#c0c0c0",

                -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
                -- label shown for this tab.
                -- The default is "Normal"
                intensity = "Bold",

                -- Specify whether you want "None", "Single" or "Double" underline for
                -- label shown for this tab.
                -- The default is "None"
                underline = "None",

                -- Specify whether you want the text to be italic (true) or not (false)
                -- for this tab.  The default is false.
                italic = false,

                -- Specify whether you want the text to be rendered with strikethrough (true)
                -- or not for this tab.  The default is false.
                strikethrough = false,
            },

            -- Inactive tabs are the tabs that do not have focus
            inactive_tab = {
                bg_color = "#202020",
                fg_color = "#808080",

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `inactive_tab`.
            },

            -- You can configure some alternate styling when the mouse pointer
            -- moves over inactive tabs
            inactive_tab_hover = {
                bg_color = "#363636",
                fg_color = "#909090",
                italic = false,

                -- The same options that were listed under the `active_tab` section above
                -- can also be used for `inactive_tab_hover`.
            }
        }
    }
}
