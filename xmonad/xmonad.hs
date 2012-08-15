import XMonad
import XMonad.Prompt
import XMonad.Prompt.Window
import XMonad.Util.EZConfig
import XMonad.Util.NamedScratchpad
import XMonad.Hooks.FadeInactive
import Anekos.Config.Layout (myLayoutHook)
import Anekos.Config.Layout (myLayoutPrompt)

scratchpads = [ NS "emacs" "emacs" (className =? "Emacs") nonFloating
              , NS "evilvte" "evilvte -fn \"VL Gothic 14\"" (className =? "Evilvte") nonFloating
              , NS "google-chrome" "google-chrome" (className =? "Google-chrome") nonFloating
	      ] where role = stringProperty "WM_WINDOW_ROLE"

myKeys = [ ("M-m", myLayoutPrompt False)
         , ("M-S-b", windowPromptGoto myXPConfig)
         , ("M-S-e", namedScratchpadAction scratchpads "emacs")
         , ("M-S-g", namedScratchpadAction scratchpads "google-chrome")
         , ("M-S-v", namedScratchpadAction scratchpads "evilvte")
         ]

myXPConfig = defaultXPConfig
             { font = "xft:VL Gothic:pixelsize=12" }

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount where fadeAmount = 0.8

main = xmonad $ defaultConfig
      { borderWidth = 0
      , layoutHook  = myLayoutHook
      , manageHook  = namedScratchpadManageHook scratchpads
      , logHook     = myLogHook
      , terminal    = "evilvte -fn \"VL Gothic 14\""
      } `additionalKeysP` (myKeys)