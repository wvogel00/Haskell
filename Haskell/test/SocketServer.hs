import Network
import System.IO 

import System.Random
import Control.Applicative
import Control.Monad (when)
import Data.IORef


type Cards = IORef [Int]
type Point = IORef Int
type GameInfo = (Point,Point , Cards,Cards)

maxN :: Int
maxN = 9

card :: IO Int
card = randomIO >>= return.(+1).(`mod` maxN).abs

takeCard 0 = return []
takeCard n = do
 num <- card
 (num:)<$>takeCard (n-1)

main :: IO ()
main = withSocketsDo $ do

 myCards    <- newIORef =<< takeCard 5
 yourCards  <- newIORef =<< takeCard 5
 myPoint    <- newIORef 0
 yourPoint  <- newIORef 0
 let gameInfo = (myPoint,yourPoint,myCards,yourCards)

 hSetBuffering stdout NoBuffering
 (server gameInfo ) `catch` (const $ putStrLn "Exception caught.")

 putStrLn "Connection closed." -- 通信終了

server :: GameInfo -> IO ()
server info = do
    sock <- listenOn (PortNumber 8001)
    repeats (receive sock info) info
    sClose sock

repeats :: IO Bool -> GameInfo -> IO () 
repeats x info =
    x >>= (\x' -> if x' then return () else server info)

receive :: Socket -> GameInfo -> IO Bool
receive sock info = do
    (h,host,port) <- accept sock
    hSetBuffering h LineBuffering

    msg <- hGetLine h
    if msg == "gameStart"
     then hPutStrLn h "start!!" >> game h info
     else putStrLn ("See You!"++msg) >> return True

game :: Handle -> GameInfo -> IO Bool
game h info@(mP,yP,mC,yC) = do
 mC' <- readIORef mC
 yC' <- readIORef yC

 putStrLn $ "PC " ++ show mC'
 putStrLn $ "PERSON " ++ show yC'

 hPutStrLn h $ "chose number :-> "++ show yC'

 input <- hGetLine h

 if any (== read input) yC'
   then do
     rand <- randomIO
     let myNumber = mC' !! (rand `mod` length mC')

     putStrLn $ "PC chose " ++ show myNumber
     putStrLn $ "PERSON chose" ++ input

     upDate (read input) yC
     upDate myNumber mC
     addPoint mP yP (read input - myNumber)

     showGameState h mP yP 
   else
     hPutStrLn h "*error! such number doesn't exist !"

 yC'' <- readIORef yC
 if null yC''
  then game h info
  else return True

upDate n cards =
 readIORef cards >>=
  \cards' -> writeIORef cards $ filter (/= n) cards'

addPoint mP yP sub
 | sub == 0 = return ()
 | sub  > 0 = addPoint' yP 1
 | sub  < 0 = addPoint' mP 1
  where
   addPoint' point n
    = readIORef point >>= \p -> writeIORef point (n+p)

showGameState h mP yP = do
 mP' <- readIORef mP
 yP' <- readIORef yP

 hPutStrLn h $ "# Player : computer = "
                ++ show yP' ++ " : " ++ show mP'
