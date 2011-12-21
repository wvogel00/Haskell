import Graphics.UI.WX
import Menu
import Interface

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
  --GUIパーツ配置
  set f m
  set f [layout := container p $ column 0
          [ (margin 2 $ row 2
               [ widget btn1
                ,widget btn2])
           , minsize (sz 200 400) $ widget showContents ]
           ,clientSize := Size 600 400]


--予定を追加するためのウィンドウを生成
addSchedule :: Date -> IO()
addSchedule (y,m,d) = do
 f <- frame [ text :=    show y ++ "年"
                 ++ show m ++"月"
                 ++ show d ++"日の予定を追加"]
 p <- panel f []
 --予定を追加
 addBtn    <- button p [text := "追加" , on command := return ()]
 --追加をキャンセル
 cancelBtn <- button p [text := "キャンセル",on command := return ()]
 --エディットボックス
 editBox <- textCtrl p [enabled := True , wrap := WrapNone]
 --GUIパーツ配置
 set f [layout := container p $ column 0
           [ minsize (Size 300 120) $ widget editBox
            ,(margin 2 $ row 2 [widget addBtn , widget cancelBtn])]
        ,clientSize := Size 250 120]

