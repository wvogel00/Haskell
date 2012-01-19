module ImageReader where

import Graphics.UI.GLUT
import Data.IORef
import Data.Word
import Data.Binary
import Data.Binary.Get
import Data.ByteString.Lazy (readFile)

type RGBA = Color4 GLfloat
type RGB  = Color3 GLfloat
type BitmapList = [RGB]

--バイナリデータから読み出した生データをGLfloatに変換
toColorValue :: Word8 -> GLfloat
toColorValue x = let str = show x
                 in (/255).fst.foldl f (0,length str-1)$ str
 where
  f (a,b) c = (a+(read [c])*16^b,b-1)


