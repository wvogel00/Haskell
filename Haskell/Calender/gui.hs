import Graphics.UI.WX
import Menu

main :: IO()
main = start hello

hello :: IO()
hello = do f <- frame [text := "test GUI with Haskell"]
           quit <- button f [text := "＜" ,on command := close f]
           btn2 <- button f [text := "＞" ,on command := close f]
           m <- myMenu
           set f m
           set f [ layout := widget quit
                  ,layout := widget btn2
                  ,clientSize := Size 600 400]
