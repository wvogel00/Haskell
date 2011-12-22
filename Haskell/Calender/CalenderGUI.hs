module CalenderGUI where

import Calender
import Interface
import Graphics.UI.WX

--calenderBlock :: (Year,Month) -> Panel () -> Button ()
calenderBlock (y,m) p
 = button p [ text := "大きさ指定"
             ,on command := return ()]

--calenderBlocks
-- = [ row calenderRow $ [widget date1..]]

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
           [ margin 30 $ minsize (Size 180 60) $ widget editBox
            ,(margin 5 $ row 2 [widget addBtn , widget cancelBtn])]
        ,clientSize := Size 250 100]
