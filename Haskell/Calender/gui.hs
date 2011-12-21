import Graphics.UI.WX
import Menu

main :: IO()
main = start gui

gui :: IO()
gui = do
 f <- frame [text := "HaskellでグイっとGUI"]
 m <- myMenu
 p <- panel f []

 --戻るボタン
 btn1 <- button p [ text := "＜"
                         ,on command := return ()]

 --進むボタン
 btn2 <- button p [ text := "＞"
                  ,on command := return ()]

 --テキスト表示画面
 showContents <- textCtrl p [enabled := False,wrap := WrapNone]


 --GUIパーツ配置
 set f m
 set f[ layout := container p $ column 0
          [ (margin 2 $ row 2
              [ widget btn1
               ,widget btn2])
           , minsize (sz 200 400) $ widget showContents ]
           ,clientSize := Size 600 400]


