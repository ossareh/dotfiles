import XMonad
import XMonad.Hooks.DynamicLog      -- needed for xmobar/dzen2
import XMonad.Hooks.ManageDocks     -- workspace support
import XMonad.Layout.Spacing        -- add spaces between tiles
import XMonad.Layout.NoBorders      -- [3]
import XMonad.Layout.PerWorkspace   -- provides onWorkspace
import XMonad.Util.EZConfig         -- needed for key map
import XMonad.Util.Run              -- provides spawnPipe and hPutStrLn
import Graphics.X11.ExtraTypes.XF86 -- needed for laptop keys

-- key bindings:
--   mod + shift + enter == terminal
--   mod + space         == cycle layouts
--   mod + shift + space == demnu (TODO)
--   mod + 1,2,3         == switch workspace

-- TODO:
--   + auto start apps
--   + auto start apps on the correct screens
--   + support those apps starting on particular screens (i.e. use irssi for irc, thus terminal on two workspaces)

-- Primary Colours
clrHighlight = "#eb5e00"
clrNeutral   = "#4d1e00"

-- The terminal you wish to use
myTerminal = "urxvt256c"

-- Brightness Settings
brightnessIncrement = "10"

-- Audio Settings 
audioIncrement = "5%"

-- workspace names
myWorkspaces = ["1:main", "2:code", "3:IM", "4:Skype"] -- TODO: add irc

-- app to workspace mapping
myManageHook = composeAll
  [
      className =? "Pidgin" --> doShift "3:IM"
    , className =? "Skype"  --> doShift "4:Skype"
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
myImLayout = tiled
  where
  -- Tall(#inMasterPane, resize%, master%)
  tiled = spacing 3 $ Tall 1 (5/100) (1/5)


myLayout = onWorkspaces ["3:IM", "4:Skype"] myImLayout $ defaultLayout

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

    -- TODO: put in `keys` constructor as demoed here [2]
    }`additionalKeys`
          -- [1]
      [   ((noModMask, xF86XK_MonBrightnessUp),   spawn ("xbacklight +" ++ brightnessIncrement))
        , ((noModMask, xF86XK_MonBrightnessDown), spawn ("xbacklight -" ++ brightnessIncrement))

        -- volume control
        , ((noModMask, xF86XK_AudioMute),         spawn "amixer set Master toggle")
        , ((noModMask, xF86XK_AudioRaiseVolume),  spawn ("amixer set Master " ++ audioIncrement ++ "+"))
        , ((noModMask, xF86XK_AudioLowerVolume),  spawn ("amixer set Master " ++ audioIncrement ++ "-"))

        -- screensaver / lock screen
        , ((noModMask, xF86XK_ScreenSaver),       spawn "xlock -mode dclock")

--        TODO: make a pretty dmenu (use clr* variables)
--        , ((mod4Mask .|. shiftMask, xK_space),
--            spawn "exe=`dmenu_run -b -nb \#333333 -nf \#4d1e00 -sf \#ff6600 -p \"run >\"` && eval \"exec $exe\"")
      ]`removeKeys`
      [
        -- (mod4Mask, xK_p) -- dmenu is going to move
      ]

-- [1] http://xmonad.org/xmonad-docs/X11/Graphics-X11-Types.html#t:KeyMask
-- [2] http://www.haskell.org/haskellwiki/John-yates-xmonad.hs
-- [3] http://braincrater.wordpress.com/2008/11/15/pimp-your-xmonad-2-smartborders/
