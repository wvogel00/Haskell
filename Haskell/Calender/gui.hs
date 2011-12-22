import Graphics.UI.WX
import Menu
import Interface
import Calender
import CalenderGUI

main :: IO()
main = start gui

gui :: IO()
gui = do
  f <- frame [text := "HaskellでグイっとGUI"]
  m <- myMenu
  p <- panel f []

  --戻るボタン
  btn1 <- button p [ text := "＜"
                    ,on command := addSchedule (2011,12,21)]
  --進むボタン
  btn2 <- button p [ text := "＞"
                    ,on command := return ()]
  --テキスト表示画面
  showContents <- textCtrl p [enabled := False,wrap := WrapNone]
  calender <- calenderBlock (2011,12) p
  --GUIパーツ配置
  set f m
  set f [ layout := container p $ column 0
           [(margin 10 $ row 2
               [ widget btn1
                ,widget btn2])
           ,(margin 10 $ row 2
               [ minsize (sz (width-250) (height-50)) $ widget calender
                ,minsize (sz 250 (height-50)) $ widget showContents ])]
         ,clientSize := Size width height]

-------------------------------------------------------
-------------------------------------------------------
