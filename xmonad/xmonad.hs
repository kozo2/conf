import XMonad

main = xmonad defaultConfig
	{ terminal = "urxvt -pe tabbed"
	}
