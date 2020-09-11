import XMonad
import System.IO (hPutStrLn)
import Data.Monoid (Endo)
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
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.ResizableTile
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.LimitWindows (limitWindows)
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
myWorkspaces = ["dev", "www"] ++ map show [3..9]

myFont :: String
myFont = "Mononoki:size=14:antialias=true:hinting=true"

myTerminal :: String
myTerminal = "st"

myStartupHook :: X ()
myStartupHook = do
    setWMName "XMonad"
    spawn "exec /home/maxim/.fehbg"
    spawn "picom &"
    spawn "dunst &"
    spawn "/home/maxim/.config/init_wm.sh"

tall     = renamed [Replace "tall"]
        $ limitWindows 12
        $ ResizableTall 1 (3/100) (1/2) []
monocle  = renamed [Replace "monocle"]
        $ noBorders
        $ limitWindows 20 Full
floats = renamed [Replace "floats"]
        $ limitWindows 20 simplestFloat

-- The layout hook
myLayoutHook = avoidStruts $ mouseResize $ windowArrange $
    mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
    where
    myDefaultLayout =   tall
                    ||| monocle
                    ||| floats

myXPConfig :: XPConfig
myXPConfig = def
      { font                = "xft:Mononoki:size=18"
      , bgColor             = "#282828"
      , fgColor             = "#ebdbb2"
      , bgHLight            = "#1d2021"
      , fgHLight            = "#fabd2f"
      , borderColor         = "#b8bb26"
      , promptBorderWidth   = 2
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

    -- Lock, Reboot, Poweroff
    , ("M-p", dirExecPrompt myXPConfig spawn "/home/maxim/.config/down_scripts")

    -- Rofi
    , ("M-S-o", spawn "rofi -modi drun -show drun -theme gruvbox-dark-soft")

    -- Override
    , ("M-<Return>", spawn myTerminal)

    -- Media Keys
    , ("<XF86AudioLowerVolume>", spawn "amixer -q sset Master 5%-")
    , ("<XF86AudioRaiseVolume>", spawn "amixer -q sset Master 5%+")
    , ("<XF86MonBrightnessDown>", spawn "doas light -U 5")
    , ("<XF86MonBrightnessUp>", spawn "doas light -A 5")
    -- For the Alt Keyboard
    , ("S-<XF86AudioLowerVolume>", spawn "doas light -U 5")
    , ("S-<XF86AudioRaiseVolume>", spawn "doas light -A 5")

    -- Controls for mocp music player.
    -- -d: dimensions, -t: title
    , ("M-u o", spawn "alacritty -d 100 26 --position 100 30 -t \"mocp\" -e mocp")
    , ("M-u p", spawn "mocp --play")
    , ("M-u l", spawn "mocp --next")
    , ("M-u h", spawn "mocp --previous")
    , ("M-u <Space>", spawn "mocp --toggle-pause")

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
    [ title =? "Mozilla Firefox"     --> doShift ( myWorkspaces !! 1 )
    , (className =? "Mozilla Firefox" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
    , title =? "mocp" --> doFloat
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
        -- , insertWindow       = W.insertDown
        , workspaces         = myWorkspaces
        , manageHook         = myManageHook
        , logHook = dynamicLogWithPP xmobarPP
                {
                    ppOutput = hPutStrLn xmproc0
                    , ppCurrent = xmobarColor "#fabd2f" "" . wrap "[" "]" -- Current workspace in xmobar
                    , ppVisible = xmobarColor "#debba5" ""                -- Visible but not current ws
                    , ppHidden = xmobarColor "#debba5" "" . wrap "[" "]"  -- Hidden workspaces in xmobar
                    , ppHiddenNoWindows = xmobarColor "#debba5" ""        -- Hidden workspaces (no windows)
                    , ppTitle = xmobarColor "#928374" "" . shorten 60     -- Title of active window
                    , ppSep =  " | "          -- Separators in xmobar
                    , ppUrgent = xmobarColor "#fb4934" "" . wrap "!" "!"  -- Urgent workspace
                    , ppExtras  = [windowCount]                           -- # of windows current workspace
                    , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                }
    } `removeKeysP` myRemKeys `additionalKeysP` myKeys

