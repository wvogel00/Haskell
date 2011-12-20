import Graphics.UI.WX

main :: IO()
main = start hello

hello :: IO()
hello = do f <- frame [text := "test GUI with Haskell"]
           quit <- button f [text := "はすける" ,on command := close f]
           set f [layout := widget quit]
