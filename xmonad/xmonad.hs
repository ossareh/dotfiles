import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86

-- basic truths:
--   mod + shift + enter == terminal
--   mod + space         == cycle layouts

-- The terminal you wish to use
myTerminal = "urxvt256c"

-- workspace names
myWorkspaces = ["1:main", "2:code", "3:IM"] -- TODO: add irc

-- app to workspace mapping
myManageHook = composeAll
  [
      -- TODO: work out how to reference variables, I should be able to
      -- write 'terminal' here in stead of urxvt256c
      className =? "google-chrome"  --> doShift "1:main"
    , className =? "urxvt256c"      --> doShift "1:main"
    , className =? "urxvt256c"      --> doShift "2:code"
    , className =? "psi"            --> doShift "3:IM"
  ]

-- layout related configs
myLayout = tiled ||| Mirror tiled ||| Full
  where
  tiled = spacing 3 $ Tall nmaster delta ratio

  -- number of windows in master tile
  nmaster = 1

  -- percent of screen master takes up
  ratio = 3/5
    
  -- percent of screen to increment when resizing tiles
  delta = 5/100


main = do
  xmonad $ defaultConfig
    {
      -- core configs
        modMask   = mod4Mask  -- use windows key for mod
      , terminal  = myTerminal

      -- tile concerns
      , borderWidth         = 2
      , normalBorderColor   = "#4d1e00"
      , focusedBorderColor  = "#cf5300"

      -- layout concerns
      , layoutHook = myLayout
      , workspaces = myWorkspaces
      , manageHook = manageDocks <+> myManageHook
        <+> manageHook defaultConfig
    }`additionalKeys`
          -- [1]
      [   ((noModMask, xF86XK_MonBrightnessUp),   spawn "xbacklight +10")
        , ((noModMask, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
      ]

-- [1] http://xmonad.org/xmonad-docs/X11/Graphics-X11-Types.html#t:KeyMask
