module Menu where

import Graphics.UI.WX
import Graphics.UI.WX.Menu

myMenu = do file <- menuPane [text := "&File"]
            mclose <- menuItem file [text := "$Close\tCtrl+C",
                                     help := "close window"]
            return [menuBar := [file]
                   ,on (menu mclose) := return ()]
