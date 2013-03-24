import XMonad
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Spacing
import XMonad.Util.EZConfig
import Graphics.X11.ExtraTypes.XF86

-- key bindings:
--   mod + shift + enter == terminal
--   mod + space         == cycle layouts
--   mod + shift + space == demnu (TODO)

-- Primary Colours
clrHighlight = "#cf5300"
clrNeutral   = "#4d1e00"

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
      , borderWidth         = 3
      , normalBorderColor   = clrNeutral
      , focusedBorderColor  = clrHighlight

      -- layout concerns
      , layoutHook = myLayout
      , workspaces = myWorkspaces
      , manageHook = manageDocks <+> myManageHook
        <+> manageHook defaultConfig
    -- TODO: put in `keys` constructor as demoed here [3]
    }`additionalKeys`
          -- [1]
      [   ((noModMask, xF86XK_MonBrightnessUp),   spawn "xbacklight +10")
        , ((noModMask, xF86XK_MonBrightnessDown), spawn "xbacklight -10")
--        TODO: make a pretty dmenu (use clr* variables)
--        , ((mod4Mask .|. shiftMask, xK_space),
--            spawn "exe=`dmenu_run -b -nb \#333333 -nf \#4d1e00 -sf \#ff6600 -p \"run >\"` && eval \"exec $exe\"")
      ]`removeKeys`
      [
        (mod4Mask, xK_p) -- dmenu is going to move
      ]

-- [1] http://xmonad.org/xmonad-docs/X11/Graphics-X11-Types.html#t:KeyMask
-- [2] /usr/share/X11/rgb.txt & WolframAlpha
--     #333333 -> rgb(51,51,51)  -> grey20
--     #4d1e00 -> rgb(77,30,0)   -> n/a
--     #ff6600 -> rgb(255,102,0) -> n/a
-- [3] http://www.haskell.org/haskellwiki/John-yates-xmonad.hs
