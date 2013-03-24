import XMonad
import XMonad.Hooks.DynamicLog      -- needed for xmobar/dzen2
import XMonad.Hooks.ManageDocks     -- workspace support
import XMonad.Layout.Spacing        -- add spaces between tiles
import XMonad.Layout.NoBorders      -- [4]
import XMonad.Layout.PerWorkspace   -- provides onWorkspace
import XMonad.Util.EZConfig         -- needed for key map
import XMonad.Util.Run              -- provides spawnPipe and hPutStrLn
import Graphics.X11.ExtraTypes.XF86 -- needed for laptop keys

-- key bindings:
--   mod + shift + enter == terminal
--   mod + space         == cycle layouts
--   mod + shift + space == demnu (TODO)
--   mod + 1,2,3         == switch workspace

-- Primary Colours
clrHighlight = "#eb5e00"
clrNeutral   = "#4d1e00"

-- The terminal you wish to use
myTerminal = "urxvt256c"

-- workspace names
myWorkspaces = ["1:main", "2:code", "3:IM"] -- TODO: add irc

-- app to workspace mapping
myManageHook = composeAll
  [
    className =? "Pidgin" --> doShift "3:IM"
  ]

-- layout related configs
defaultLayout = tiled ||| Mirror tiled ||| Full
  where
  tiled = spacing 3 $ Tall nmaster delta ratio

  -- number of windows in master tile
  nmaster = 1

  -- percent of screen master takes up
  ratio = 3/5
    
  -- percent of screen to increment when resizing tiles
  delta = 5/100

--
-- this only really works because pidgin uses tabs
pidginLayout = tiled
  where
  -- Tall(#inMasterPane, resize%, master%)
  tiled = spacing 3 $ Tall 1 (5/100) (1/5)


myLayout = onWorkspace "3:IM" pidginLayout $ defaultLayout

main = do
  -- depends on the fact that ~/.xmobarrc exists
  xmproc <- spawnPipe "xmobar"
  xmonad $ defaultConfig
    {
      -- core configs
        modMask   = mod4Mask  -- use windows key for mod
      , terminal  = myTerminal

      -- tile concerns
      , borderWidth         = 3
      , normalBorderColor   = clrNeutral
      , focusedBorderColor  = clrHighlight

      -- layout concerns
      , layoutHook = avoidStruts $ smartBorders $ myLayout
      , workspaces = myWorkspaces
      , manageHook = myManageHook <+> manageHook defaultConfig

      -- resize tiles when xmobar is ready
      , handleEventHook = docksEventHook
      , logHook = dynamicLogWithPP xmobarPP
        {
            ppOutput = hPutStrLn xmproc
            -- TODO: can we highlight the in focus window in a nicer way?
            -- replace green, it is so ghetto
          , ppTitle  = xmobarColor "green" "" . shorten 50
          , ppLayout = const ""   -- disables layout output
        }

    -- TODO: put in `keys` constructor as demoed here [3]
    }`additionalKeys`
          -- [1]
      [   ((noModMask, xF86XK_MonBrightnessUp),   spawn "xbacklight +10")
        , ((noModMask, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
--        TODO: make a pretty dmenu (use clr* variables)
--        , ((mod4Mask .|. shiftMask, xK_space),
--            spawn "exe=`dmenu_run -b -nb \#333333 -nf \#4d1e00 -sf \#ff6600 -p \"run >\"` && eval \"exec $exe\"")
--        TODO: support screensaver button to lock screen
      ]`removeKeys`
      [
        -- (mod4Mask, xK_p) -- dmenu is going to move
      ]

-- [1] http://xmonad.org/xmonad-docs/X11/Graphics-X11-Types.html#t:KeyMask
-- [2] /usr/share/X11/rgb.txt & WolframAlpha
--     #333333 -> rgb(51,51,51)  -> grey20
--     #4d1e00 -> rgb(77,30,0)   -> n/a
--     #ff6600 -> rgb(255,102,0) -> n/a
-- [3] http://www.haskell.org/haskellwiki/John-yates-xmonad.hs
-- [4] http://braincrater.wordpress.com/2008/11/15/pimp-your-xmonad-2-smartborders/
