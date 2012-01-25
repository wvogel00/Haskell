module ImageReader where

import Graphics.UI.GLUT
import Data.Word
import Data.Binary
import Data.Binary.Get
import Data.ByteString.Lazy as L (readFile)
import Control.Monad (foldM)
import Control.Applicative

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

--1画素を読む
readColor3 :: Int -> Get [Color3 GLfloat]
readColor3 0 = return []
readColor3 n = do
 b <- getWord8
 g <- getWord8
 r <- getWord8
 let x = [Color3 (toGLfloat r) (toGLfloat g) (toGLfloat b)]
 xs <- ((x++)<$>readColor3 (n-24))
 return xs

--読み込んだ画素情報のリストを返す
readBmp :: String -> IO [RGB]
readBmp filePath = do
  binaryFile <- L.readFile filePath
  return $ runGet bmpImageList binaryFile

--ヘッダ情報の確認用
showInfo = do
 f <- readBmpFileHeader
 i <- readBmpInfoHeader
 return (f,i)

--読み込んだビットマップリストを返す
bmpImageList :: Get [RGB]
bmpImageList = do
 f <- readBmpFileHeader
 i <- readBmpInfoHeader
 xs <- readColor3 (read.show $ biSizeImage i)
 return (f,i)
 return xs
