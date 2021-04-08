import XMonad
import System.IO (hPutStrLn)
import Data.Monoid (Endo)
import Data.Time.Clock
import Data.Time.Calendar
import System.Exit (exitSuccess)
import XMonad.Actions.Search

import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)

import XMonad.Hooks.ManageDocks (avoidStruts, docks, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.SetWMName
import XMonad.Hooks.InsertPosition

import XMonad.Layout.NoBorders
import XMonad.Layout.Spacing
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.ResizableTile
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import XMonad.Layout.SimplestFloat (simplestFloat)

import XMonad.Actions.MouseResize

import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.RunOrRaise
import XMonad.Prompt.DirExec

import qualified XMonad.Actions.Search as S

modm :: KeyMask
modm = mod1Mask

myWorkspaces :: [WorkspaceId]
myWorkspaces = ["dev", "www", "run", "tms", "zoo"] ++ map show [6..7] ++ ["avd", "flt"]

myFont :: String
myFont = "Mononoki:size=14:antialias=true:hinting=true,xft:FontAwesome:size=12"

myTerminal :: String
myTerminal = "alacritty"

myStartupHook :: X ()
myStartupHook = do
    setWMName "XMonad"
    spawn "/usr/bin/dunst"
    spawn "/usr/bin/picom"
    spawn "/home/maxim/.fehbg"

tall     = renamed [Replace "tall"]
        $ spacing 3
        $ noBorders
        $ ResizableTall 1 (3/100) (1/2) []
monocle  = renamed [Replace "monocle"]
        $ noBorders
        $ Full
floats = renamed [Replace "floats"]
        $ noBorders
        $ simplestFloat

-- The layout hook
myLayoutHook = avoidStruts $ mouseResize $ windowArrange $
    mkToggle (NBFULL ?? NOBORDERS ?? EOT) $
    onWorkspaces ["www", "flt", "tms", "zoo"] monocle $
    myDefaultLayout
    where
    myDefaultLayout =   tall
                    ||| monocle
                    ||| floats

myXPConfig :: XPConfig
myXPConfig = def
      { font                = "xft:Mononoki:size=18"
      , bgColor             = "#b8bb26"
      , fgColor             = "#1d2021"
      , bgHLight            = "#ebdbb2"
      , fgHLight            = "#fabd2f"
      , borderColor         = "#b8bb26"
      , promptBorderWidth   = 0
      , position            = CenteredAt { xpCenterY = 0.2, xpWidth = 0.7 }
      , height              = 50
      , historySize         = 256
      , historyFilter       = id
      , defaultText         = []
      , autoComplete        = Just 0  -- set Just 100000 for .1 sec
      , showCompletionOnTab = True
      , searchPredicate     = isPrefixOf
      , alwaysHighlight     = True
      , maxComplRows        = Nothing      -- set to Just 5 for 5 rows
      }

-- The same config above minus the autocomplete feature which is annoying
-- on certain Xprompts, like the search engine prompts.
myXPConfig' :: XPConfig
myXPConfig' = myXPConfig
      { autoComplete        = Nothing
      , searchPredicate     = fuzzyMatch
      }

archwiki, fontawesome:: S.SearchEngine
archwiki = S.searchEngine "archwiki" "https://wiki.archlinux.org/index.php?search="
fontawesome = S.searchEngine "fontawesome" "https://fontawesome.com/icons?d=gallery&q="

-- This is the list of search engines that I want to use. Some are from
-- XMonad.Actions.Search, and some are the ones that I added above.
searchList :: [(String, S.SearchEngine)]
searchList = [ ("a", archwiki)
             , ("d", S.duckduckgo)
             , ("g", S.google)
             , ("h", S.hoogle)
             , ("i", fontawesome)
             , ("s", S.scholar) -- google scholar
             , ("w", S.alpha) -- wolfram alpha
             , ("y", S.youtube)
             , ("z", S.amazon)
             ]

-- -d: dimensions, -t: title
spawnFloatingTerm :: String -> X ()
spawnFloatingTerm cmd = spawn $ "alacritty " ++ opt ++ " -e" ++ cmd
    where
        opt = col ++ lin ++ posx ++ posy ++ floatDecorator
            where
                col = "-o window.dimensions.columns=200 "   -- 123
                lin = "-o window.dimensions.lines=35 "      -- 34
                posx = "-o window.position.x=60 "           -- 10
                posy = "-o window.position.y=40 "           -- 10
                floatDecorator = "-t \"float\""

replace :: Eq t => t -> t -> [t] -> [t]
replace a b = map (\c -> if c==a then b; else c)

buildMaimString :: String -> String
buildMaimString = wrap pre post . replace ' ' '_' . replace ':' '-' . take 19
    where
        pre = "/usr/bin/maim -m 10 /home/maxim/bilder/screenshots/"
        post = ".png"

myKeys :: [(String, X ())]
myKeys = [
    -- XMonad
      ("M-r", spawn "xmonad --recompile")       -- Recompiles xmonad
    , ("M-S-r", spawn "xmonad --restart")       -- Restarts xmonad
    , ("M-S-e", io exitSuccess)                 -- Quits xmonad
    , ("M-S-q", kill)                           -- kill client
    , ("M-b", sendMessage ToggleStruts)         -- Toggle xmobar
    , ("M-t", withFocused $ windows . W.sink)   -- Tile client again
    , ("M-m", windows W.swapMaster)             -- Set master
    , ("M-n", sendMessage MirrorExpand)         -- expand tile
    , ("M-S-n", sendMessage MirrorShrink)       -- shrink tile

    --, ("M-e", spawn "eww close-all")            -- close all widgets
    , ("M-n", spawn "/usr/bin/firefox")
    , ("M-s", liftIO (fmap show getCurrentTime) >>= spawn . buildMaimString )
    , ("M-S-s", spawn "/usr/bin/maim --select -m 10 | xclip -selection clipboard -target image/png")

    , ("M-S-d", sendMessage (IncMasterN 1))     -- one more master
    , ("M-d", sendMessage (IncMasterN (-1)))    -- one master fewer

    -- Lock, Reboot, Poweroff
    , ("M-p", dirExecPrompt myXPConfig spawn "/home/maxim/.config/down_scripts")

    -- Rofi
    , ("M-S-o", spawn "rofi -modi drun -show drun -theme gruvbox-dark-soft")

    -- Override
    , ("M-<Return>", spawn myTerminal)

    -- Media Keys
    , ("<XF86AudioLowerVolume>", spawn "amixer -q sset Master 5%-")
    , ("<XF86AudioRaiseVolume>", spawn "amixer -q sset Master 5%+")
    , ("<XF86AudioMute>",        spawn "amixer -q sset Master toggle")
    , ("<XF86MonBrightnessDown>", spawn "doas light -U 5")
    , ("<XF86MonBrightnessUp>", spawn "doas light -A 5")
    -- For the Alt Keyboard
    , ("S-<XF86AudioLowerVolume>", spawn "doas light -U 5")
    , ("S-<XF86AudioRaiseVolume>", spawn "doas light -A 5")

    -- Controls for mocp music player.
    , ("M-u o", spawnFloatingTerm "mocp")
    , ("M-u p", spawn "mocp --play")
    , ("M-u l", spawn "mocp --next")
    , ("M-u h", spawn "mocp --previous")
    , ("M-u <Space>", spawn "mocp --toggle-pause")
    , ("M-u m", spawnFloatingTerm "doas alsamixer")

    -- Master thesis
    , ("M-S-b", spawn "zathura ~/dokumente/isento/gps/pybullet_quickstartguide.pdf")

    -- Prompt
    , ("M-o", runOrRaisePrompt myXPConfig)
    , ("M-i m", manPrompt myXPConfig')
    ]
    ++ [("M-i " ++ k, S.promptSearch myXPConfig' f) | (k,f) <- searchList ]
    ++ [("M-S-i " ++ k, S.selectSearch f) | (k,f) <- searchList ]

myRemKeys :: [String]
myRemKeys = [
        "M-S-<Return>"
        , "M-S-q"
    ]

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = insertPosition Below Newer <+> composeAll
    [ -- Firefox
      title =? "Mozilla Firefox"               --> doShift ( myWorkspaces !! 1 )
    , (className =? "Mozilla Firefox" <&&> resource =? "Dialog") --> doFloat
    -- Teams
    , className =? "Microsoft Teams - Preview" --> doShift ( myWorkspaces !! 3 )
    , title =? "Microsoft Teams-Benachrichtigung"   --> doFloat
    -- Zoom
    , className =? "zoom"                       --> doShift ( myWorkspaces !! 4 )
    -- Android Dev
    , title =? "Emulator"                      --> doShift ( myWorkspaces !! 7 )
    , className =? "Android Emulator"          --> doShift ( myWorkspaces !! 7 )
    , className =? "jetbrains-studio"          --> doShift ( myWorkspaces !! 8 )
    , title =? "Android Virtual Device Manager"     --> doFloat
    , title =? "Emulator"                           --> doFloat
    , className =? "Android Emulator"               --> doFloat
    -- Gimp
    , stringProperty "WM_WINDOW_ROLE" =? "gimp-message-dialog" --> doFloat
    -- Generic
    , title =? "float"                              --> doFloat
    ]

main = do
    xmproc0 <- spawnPipe "xmobar"
    xmonad $ docks $ def {
        modMask              = modm
        , focusFollowsMouse  = False
        , borderWidth        = 1
        , terminal           = myTerminal
        , focusedBorderColor = "#b8bb26"
        , normalBorderColor  = "#f2e5bc"
        , layoutHook         = myLayoutHook
        , startupHook        = myStartupHook
        , workspaces         = myWorkspaces
        , manageHook         = myManageHook
        , logHook = dynamicLogWithPP xmobarPP
                {
                    ppOutput = hPutStrLn xmproc0
                    , ppCurrent = xmobarColor "#b8bb28" ""                -- Current workspace in xmobar
                    , ppVisible = xmobarColor "#fabd2f" ""                -- Visible but not current ws
                    , ppHidden = xmobarColor "#fabd2f" ""                 -- Hidden workspaces in xmobar
                    , ppHiddenNoWindows = xmobarColor "#928374" ""        -- Hidden workspaces (no windows)
                    , ppTitle = xmobarColor "#bdae93" "" . shorten 60     -- Title of active window
                    , ppSep =  " | "                                      -- Separators in xmobar
                    , ppUrgent = xmobarColor "#fb4934" "" . wrap "!" "!"  -- Urgent workspace
                    , ppExtras  = [windowCount]                           -- # of windows current workspace
                    , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                }
    } `removeKeysP` myRemKeys `additionalKeysP` myKeys

