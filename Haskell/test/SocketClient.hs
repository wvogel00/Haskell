module SocketClient where

import Network
import System.IO 
import Interface

start = withSocketsDo $ do
 hSetBuffering stdout NoBuffering
 h <- connectTo "127.0.0.1" (PortNumber 8001)
 hSetBuffering h LineBuffering

 hPutStrLn h gameStart
 statement <- hGetLine h
 print statement
 if statement == startStatement
  then game h
  else return ()
 hClose h

game :: Handle -> IO()
game h = do
 seeCards h
 putStrLn ">?"
 getLine >>= hPutStrLn h

 continuableOrNot h
 where
  seeCards h = hGetLine h >>= putStrLn
  continuableOrNot h = do   --得点又はエラー文章を取得
    hGetLine h >>= putStrLn.(++) "PC card >" -- PCの選んだカードを見る
    hGetLine h >>= putStrLn -- ゲームの状況を見る

    state <- hGetLine h

    case state of
     continue -> game h
     end      -> hGetLine h >>= putStrLn

chose number = withSocketsDo $ do
 hSetBuffering stdout NoBuffering
 h <- connectTo "127.0.0.1" (PortNumber 8001)
 hSetBuffering h LineBuffering

 hPrint h number
 hGetLine h >>= print
 hClose h

sendMessage msg = withSocketsDo $ do 
        hSetBuffering stdout NoBuffering 
        h <- connectTo "127.0.0.1" (PortNumber 8001)
        hSetBuffering h LineBuffering
        hPutStrLn h msg
        hGetLine h >>= print
        hClose h
