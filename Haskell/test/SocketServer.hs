import Network
import System.IO 

import System.Random
import Control.Applicative
import Control.Monad (when)
import Data.IORef
import Interface

type Cards = IORef [Int]
type Point = IORef Int
type GameInfo = (Point,Point , Cards,Cards)

data Winner = You | I | Stalemate deriving Eq

main :: IO ()
main = withSocketsDo $ do

 myCards <- newIORef [1..5]
 yourCards <- newIORef [1..5]
 myPoint    <- newIORef 0
 yourPoint  <- newIORef 0
 let gameInfo = (myPoint,yourPoint,myCards,yourCards)

 hSetBuffering stdout NoBuffering
 (server gameInfo ) `catch` (const $ putStrLn "Exception caught.")

 putStrLn "Connection closed." -- 通信終了

server :: GameInfo -> IO ()
server info = do
    sock <- listenOn (PortNumber 8001)
    --repeats (receive sock info) info
    bool <- receive sock info
    if bool
     then sClose sock
     else putStrLn "error" >> sClose sock

repeats :: IO Bool -> GameInfo -> IO () 
repeats x info =
    x >>= (\x' -> if x' then return () else server info)

receive :: Socket -> GameInfo -> IO Bool
receive sock info = do
    (h,host,port) <- accept sock
    hSetBuffering h LineBuffering

    msg <- hGetLine h
    if msg == gameStart
     then hPutStrLn h startStatement >> game h info
     else putStrLn ("See You!"++msg) >> return True

game :: Handle -> GameInfo -> IO Bool
game h info@(mP,yP,mC,yC) = do
 mC' <- readIORef mC
 yC' <- readIORef yC

 putStrLn $ "PC " ++ show mC'
 putStrLn $ "PERSON " ++ show yC'

 hPutStrLn h $ "choose number :-> "++ show yC'

 input <- hGetLine h

 if any (== read input) yC'
   then do
     rand <- randomIO
     let myNumber = mC' !! (rand `mod` length mC')

     hPutStrLn h $ show myNumber

     putStrLn $ "PC chose " ++ show myNumber
     putStrLn $ "PERSON chose" ++ input

     upDate (read input) yC
     upDate myNumber mC
     addPoint mP yP (read input - myNumber)

     showGameState h mP yP
   else
     hPutStrLn h "*error! such number doesn't exist !"

 yC'' <- readIORef yC
 bool <- judge h mP yP yC''
 if bool
  then return True
  else game h info

judge :: Handle -> Point -> Point -> [Int]-> IO Bool
judge h mP yP cards= do
 if not $ null cards
  then hPutStrLn h continue >> return False
  else do hPutStrLn h end
          mP' <- readIORef mP
          yP' <- readIORef yP
          case winnerIs (yP' - mP') of
            You -> hPutStrLn h "*******You Win !!!*******"
            I   -> hPutStrLn h "-------You Lose!!!-------"
            Stalemate -> hPutStrLn h "+++++STALEMATE+++++"
          return True
  where
   winnerIs p
    | p > 0  = You
    | p < 0  = I
    | p == 0 = Stalemate

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
