Config { font = "Mononoki Nerd Font 12"
       , additionalFonts = []
       , borderColor = "#161616"
       , border = TopB
       , bgColor = "#161616"
       , fgColor = "#ebdbb2"
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
                               "--high","#fb4934"
                               , "-t", "<total>%"] 20
                    , Run Date "%b %d %Y %H:%M" "date" 300
                    -- battery monitor
                    , Run Battery        [ "--template" , "<acstatus>"
                                , "--Low"      , "10"        -- units: %
                                , "--High"     , "95"        -- units: %
                                , "--low"      , "#fb4934"
                                , "--high"     , "#98971a"

                                -- send message when low
                                , "-a", "notify-send -u critical battery"
                                --, "-A", "5"
                                , "--" -- battery specific options
                                -- discharging status
                                , "-o"  , " <left>% <timeleft>"
                                -- AC "on" status
                                , "-O"    , "<left>% <fc=#fabd2f> Charging</fc>"
                                -- charged status
                                , "-i"  , "<fc=#98971a> Charged</fc>"
                            ] 150
                    , Run StdinReader
                    ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " <fc=#D4879C>λ</fc> | %battery% | %StdinReader% | }\
                    \{ | <fc=#8ec07c>  %cpu%</fc> | <fc=#D4879C>  %dynnetwork%</fc> | <fc=#fabd2f>  %date%</fc> "
       }
       --         
