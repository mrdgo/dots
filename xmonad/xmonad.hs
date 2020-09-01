import XMonad
import System.IO (hPutStrLn)
import Data.Monoid (Endo)
import System.Exit (exitSuccess)
import XMonad.Actions.Search

import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce

import XMonad.Hooks.ManageDocks (avoidStruts, docks, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.SetWMName

import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.ResizableTile
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.LimitWindows (limitWindows)
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))

import XMonad.Actions.MouseResize

import XMonad.Prompt
import XMonad.Prompt.Man
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.RunOrRaise

import qualified XMonad.Actions.Search as S

modm :: KeyMask
modm = mod4Mask

myWorkspaces :: [WorkspaceId]
myWorkspaces = ["dev", "www", "moc"] ++ map show [4..9]

myFont :: String
myFont = "Mononoki:size=14:antialias=true:hinting=true"

myTerminal :: String
myTerminal = "/home/maxim/.cargo/bin/alacritty"

myStartupHook :: X ()
myStartupHook = setWMName "XMonad"

tall     = renamed [Replace "tall"]
        $ limitWindows 12
        $ ResizableTall 1 (3/100) (1/2) []
monocle  = renamed [Replace "monocle"]
        $ noBorders
        $ limitWindows 20 Full

-- The layout hook
myLayoutHook = avoidStruts $ mouseResize $ windowArrange $
    mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
    where
    myDefaultLayout =   tall
                    ||| monocle

myXPConfig :: XPConfig
myXPConfig = def
      { font                = "xft:Mononoki:size=18"
      , bgColor             = "#282828"
      , fgColor             = "#ebdbb2"
      , bgHLight            = "#1d2021"
      , fgHLight            = "#fabd2f"
      , borderColor         = "#b8bb26"
      , promptBorderWidth   = 0
      --, promptKeymap        = myXPKeymap
      --, position            = Top
      , position            = CenteredAt { xpCenterY = 0.3, xpWidth = 0.3 }
      , height              = 50
      , historySize         = 256
      , historyFilter       = id
      , defaultText         = []
      , autoComplete        = Just 0  -- set Just 100000 for .1 sec
      , showCompletionOnTab = True
      , searchPredicate     = isPrefixOf
      --, searchPredicate     = fuzzyMatch
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

archwiki :: S.SearchEngine
archwiki = S.searchEngine "archwiki" "https://wiki.archlinux.org/index.php?search="

-- This is the list of search engines that I want to use. Some are from
-- XMonad.Actions.Search, and some are the ones that I added above.
searchList :: [(String, S.SearchEngine)]
searchList = [ ("a", archwiki)
             , ("d", S.duckduckgo)
             , ("g", S.google)
             , ("h", S.hoogle)
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

    -- Rofi
    , ("M-S-o", spawn "rofi -modi drun -show drun -theme gruvbox-dark-soft")
    , ("M-S-p", spawn "/home/maxim/.config/down_script.sh")

    -- Override
    , ("M-<Return>", spawn myTerminal)

    -- Media Keys
    , ("<XF86AudioLowerVolume>", spawn "amixer -q sset Master 5%-")
    , ("<XF86AudioRaiseVolume>", spawn "amixer -q sset Master 5%+")
    , ("<XF86MonBrightnessDown>", spawn "light -U 5")
    , ("<XF86MonBrightnessUp>", spawn "light -A 5")
    -- For the Alt Keyboard
    , ("S-<XF86AudioLowerVolume>", spawn "light -U 5")
    , ("S-<XF86AudioRaiseVolume>", spawn "light -A 5")

    -- Prompt
    , ("M-S-m", manPrompt myXPConfig')
    , ("M-o", runOrRaisePrompt myXPConfig)
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
myManageHook = composeAll
    [ title =? "Mozilla Firefox"     --> doShift ( myWorkspaces !! 1 )
    , (className =? "Mozilla Firefox" <&&> resource =? "Dialog") --> doFloat  -- Float Firefox Dialog
    ] 

main = do
    xmproc0 <- spawnPipe "xmobar -x 0"
    xmonad $ docks $ def {
        modMask              = modm
        , focusFollowsMouse  = False
        , borderWidth        = 1
        , terminal           = myTerminal
        , focusedBorderColor = "#b8bb26"
        , normalBorderColor  = "#f2e5bc"
        , layoutHook         = myLayoutHook
        , startupHook        = myStartupHook
        , insertWindow       = W.insertDown
        , workspaces         = myWorkspaces
        , manageHook         = myManageHook
        , logHook = dynamicLogWithPP xmobarPP
                {
                    ppOutput = hPutStrLn xmproc0
                    , ppCurrent = xmobarColor "#b8bb26" "" . wrap "[" "]" -- Current workspace in xmobar
                    , ppVisible = xmobarColor "#b8bb26" ""                -- Visible but not current workspace
                    , ppHidden = xmobarColor "#458588" "" . wrap "[" "]"  -- Hidden workspaces in xmobar
                    , ppHiddenNoWindows = xmobarColor "#b16286" ""        -- Hidden workspaces (no windows)
                    , ppTitle = xmobarColor "#b8bb26" "" . shorten 60     -- Title of active window in xmobar
                    , ppSep =  "<fc=#f2e5bc> <fn=2>|</fn> </fc>"          -- Separators in xmobar
                    , ppUrgent = xmobarColor "#fb4934" "" . wrap "!" "!"  -- Urgent workspace
                    , ppExtras  = [windowCount]                           -- # of windows current workspace
                    , ppOrder  = \(ws:l:t:ex) -> [ws,l]++ex++[t]
                }
    } `removeKeysP` myRemKeys `additionalKeysP` myKeys

