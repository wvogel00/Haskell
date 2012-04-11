module SocketClient where

import Network
import System.IO 

start = withSocketsDo $ do
 hSetBuffering stdout NoBuffering
 h <- connectTo "127.0.0.1" (PortNumber 8001)
 hSetBuffering h LineBuffering

 hPutStrLn h "gameStart"
 statement <- hGetLine h
 print statement
 if statement == "start!!"
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
    str <- hGetLine h
    putStrLn str
    if head str == '*'
      then hPutStrLn h ""
      else game h

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
