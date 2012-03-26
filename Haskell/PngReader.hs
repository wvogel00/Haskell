import Data.ByteString.Lazy as L
import Data.Binary
import Data.Binary.Get
import Data.Word
import Data.Char (chr)
import Control.Applicative((<$>),(<|>))

data IHDR =
 IHDR { ilength   :: Word32--恒に13
       ,chunkType :: String--ASCIIで"IHDR"
       ,width     :: Word32
       ,height    :: Word32
       ,bitDepth  :: Word8 -- 1,2,4,8,16
       ,colorType :: Word8 -- 1::パレット 2::color 4::αチャンネル
       ,compress  :: Word8
       ,filterWay :: Word8
       ,interRace :: Word8
       ,cRC       :: Word32
      } deriving (Show,Eq)

--Getモナドを読み出す
readPng filePath = do
 contents <- L.readFile filePath
 return $ runGet readFileInfo contents

--ファイル情報を入手し、画像データを返す
readFileInfo :: Get (Maybe (IHDR,String))
readFileInfo = do
 signature <- readFileSignature  -- [89,50,4E,47,0D,0A,1A,0A]
 if Prelude.map fromIntegral signature == [137,80,78,71,13,10,26,10]
  then do ihdr <- readIHDR
          imageData <- readChunk
          return $ Just (ihdr,imageData)
  else do return Nothing

--ファイルシグネチャを読む
readFileSignature = readFileSignature' 8
 where
  readFileSignature' 0 = return []
  readFileSignature' n = do
   signature <- getWord8
   return =<<(signature:)<$>readFileSignature' (n-1)

--IHDR chunkを読み込む
readIHDR :: Get IHDR
readIHDR = do
 l  <- getWord32le
 cType <- readChunkType
 w  <- getWord32le
 h  <- getWord32le
 bit<- getWord8
 col<- getWord8
 com<- getWord8
 fw <- getWord8
 ir <- getWord8
 crc<- getWord32le
 return $ IHDR {ilength = l,chunkType = cType,
                width = w,height = h,
                bitDepth = bit,colorType = col,compress = com,
                filterWay = fw , interRace = ir , cRC = crc}

--chunke typeを返す
readChunkType :: Get String
readChunkType = do
 t1 <- getWord8
 t2 <- getWord8
 t3 <- getWord8
 t4 <- getWord8
 return $ Prelude.map (chr.fromIntegral) [t1,t2,t3,t4]

--IDAT or PLTE chunkを読み込む
readChunk = do
-- cLength <- getWord32le
 cType  <- readChunkType
 case cType of
  "IDAT" -> return "IDAT"
  "PLTE" -> return "PLTE"
  "IEND" -> return "IEND"
  _ -> skip 1 >> readChunk

readIDAT cLength = do
 return cLength

main = do
 print =<< readPng "haskell.png"
