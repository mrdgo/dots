Config { font = "xft:Mononoki Nerd Font:pixelsize=14:antialias=true:hinting=true"
       , additionalFonts = []
       , borderColor = "#1a1b26"
       , border = TopB
       , bgColor = "#1a1b26"
       , fgColor = "#19b1d6"
       , alpha = 255
       , position = TopP 0 0
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = True
       , overrideRedirect = True
       , commands = [ Run DynNetwork ["--", "--devices", "wlp6s0,enp0s31f6"] 50
                    , Run Cpu ["-L","3","-H","50",
                               "--high","#f7768e"
                               , "-t", "<total>%"] 20
                    , Run Date "%b %d %Y %H:%M" "date" 300
                    -- battery monitor
                    , Run Battery        [ "--template" , "<acstatus>"
                                , "--Low"      , "10"        -- units: %
                                , "--High"     , "95"        -- units: %
                                , "--low"      , "#f7768e"
                                , "--high"     , "#9ece6a"

                                -- send message when low
                                , "-a", "notify-send -u critical battery"
                                --, "-A", "5"
                                , "--" -- battery specific options
                                -- discharging status
                                , "-o"  , " <left>% <timeleft>"
                                -- AC "on" status
                                , "-O"    , "<left>% <fc=#e0af68> Charging</fc>"
                                -- charged status
                                , "-i"  , "<fc=#9ece6a> Charged</fc>"
                            ] 150
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " <fc=#e0af67>λ</fc> | %battery% | %StdinReader% | }\
                    \{ | <fc=#83a598>  %cpu%</fc> | <fc=#9a7ecc>  %dynnetwork%</fc> | <fc=#e0af68>  %date%</fc> "
       }
       --         
