module SocketClient where

import Network
import System.IO 

start = sendMessage "start"

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
