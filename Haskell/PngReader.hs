import Data.ByteString.Lazy as L
import Data.Binary
import Data.Binary.Get
import Data.Word
import Control.Applicative((<$>),(<|>))

data IHDR =
 IHDR { ilength    :: Word32--恒に13
       ,chunkType :: Word32--ASCIIで"IHDR"
       ,width     :: Word32
       ,height    :: Word32
       ,bitDepth  :: Word8 -- 1,2,4,8,16
       ,colorType :: Word8 -- 1::パレット 2::color 4::αチャンネル
       ,compress  :: Word8
       ,filterWay :: Word8
       ,interRace :: Word8
       ,cRC       :: Word32
      } deriving (Show,Eq)

readPng filePath = do
 contents <- L.readFile filePath
 return $ runGet readFileInfo contents

readFileInfo = do
 signature <- readFileSignature
 ihdr <- readIHDR
 return (signature,ihdr) 

readFileSignature = readFileSignature' 8
 where
  readFileSignature' 0 = return []
  readFileSignature' n = do
   signature <- getWord8
   return =<<(signature:)<$>readFileSignature' (n-1)

readIHDR :: Get IHDR
readIHDR = do
 l  <- getWord32le
 ct <- getWord32le
 w  <- getWord32le
 h  <- getWord32le
 bit<- getWord8
 col<- getWord8
 com<- getWord8
 fw <- getWord8
 ir <- getWord8
 crc<- getWord32le
 return $ IHDR {ilength = l,chunkType = ct,width = w,height = h,
                bitDepth = bit,colorType = col,compress = com,
                filterWay = fw , interRace = ir , cRC = crc}

main = do
 xs <- readPng "haskell.png"
 print xs
