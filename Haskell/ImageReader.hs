module ImageReader where

import Graphics.UI.GLUT
import Data.Word
import Data.Binary
import Data.Binary.Get
import Data.ByteString.Lazy as L (readFile)
import Control.Applicative
import Control.Monad
import Interface(Pos,width,height)

type RGBA = Color4 GLfloat
type RGB  = Color3 GLfloat

data BmpFileHeader = BmpFileHeader {
  bfType :: Word16,	--ファイルタイプ(0x424d)
  bfSize :: Word32	--ファイルサイズ
} deriving Show

data BmpInfoHeader = BmpInfoHeader {
  biSize      :: Word32,--通常0x28
  biWidth     :: Word32,
  biHeight    :: Word32,
  biBitCount  :: Word16,--ピクセルあたりのビット数(1,4,8,16)
  biSizeImage :: Word32	--純粋な過疎情報サイズ
} deriving Show

-- .bmpファイルのファイルヘッダを読み込む
readBmpFileHeader :: Get BmpFileHeader
readBmpFileHeader = do
  t <- getWord16le
  s <- getWord32le
  skip 8
  return $ BmpFileHeader {bfType = t , bfSize = s}

-- .bmpファイルの情報ヘッダを読み込む
readBmpInfoHeader :: Get BmpInfoHeader
readBmpInfoHeader = do
  s <- getWord32le
  w <- getWord32le
  h <- getWord32le
  skip 2
  c <- getWord16le
  skip 4
  size <- getWord32le
  skip 16
  return $ BmpInfoHeader
           { biSize = s ,
             biWidth = w , biHeight = h ,
             biBitCount = c , biSizeImage = size
           }

--バイナリデータから読み出した生データをGLfloatに変換
toGLfloat :: Word8 -> GLfloat
toGLfloat = (/255).read.show

--画素を読む
readColor3 :: Int -> Get [Color3 GLfloat]
readColor3 0 = return []
readColor3 n = do
 b <- getWord8
 g <- getWord8
 r <- getWord8
 let x = [Color3 (toGLfloat r) (toGLfloat g) (toGLfloat b)]
 xs <- ((x++)<$>readColor3 (n-3))
 return xs

--読み込んだ画素情報のリストを返す
readBmp :: String -> IO (Int,Int,[RGB])
readBmp filePath = do
  binaryFile <- L.readFile filePath
  return $ runGet bmpImageList binaryFile

--ヘッダ情報の確認
showInfo = do
 f <- readBmpFileHeader
 i <- readBmpInfoHeader
 return (f,i)

--読み込んだビットマップリストを返す
bmpImageList :: Get (Int,Int,[RGB])
bmpImageList = do
 f <- readBmpFileHeader
 i <- readBmpInfoHeader
 xs <- readColor3 (read.show $ biSizeImage i)
 return (toInt (biWidth i) , toInt (biHeight i),xs)
 where
  toInt = read.show

-------------------------------------------------------
-----------------------画像描画部----------------------

--画像を描画する
showImage :: Pos -> (Int,Int,[RGB]) -> IO()
showImage (x,y) (w,h,xs) = do
 let poses = map f [(y,x)|y<-[h,h-1..1],x<-[1..w]]
 forM_ (zip poses xs) imageDot
 where
  f :: (Int,Int) -> (GLfloat,GLfloat)
  f (y',x') = (fromIntegral x'*2/width+x,fromIntegral y'*2/height+y-1)

--一画素を描画
imageDot :: (Pos,Color3 GLfloat) ->IO()
imageDot ((x,y),c) =
 preservingMatrix $ do
  color c
  renderPrimitive Points $ vertex $ Vertex2 x y
