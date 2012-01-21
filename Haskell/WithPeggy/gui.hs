import Graphics.UI.WX
import Graphics.UI.WXCore (bitmapGetSize)
import Perser

width  = 800
height = 600

main = start novelEngine

novelEngine :: IO()
novelEngine = do
 bm<- bitmapCreateFromFile "haskell.png"
 f <- frame [text := "天使代理人",
             on paint := onPaint bm,
             clientSize := Size width height]
 repaint f

onPaint :: Bitmap() -> DC() -> Rect -> IO()
onPaint bm dc viewArea = drawBitmap dc bm pointZero False []
