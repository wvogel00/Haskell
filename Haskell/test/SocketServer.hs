import Network
import System.IO 

import System.Random
import Control.Applicative
import Data.IORef

type Cards = IORef [Int]
type Point = IORef Int
type GameInfo = ((Point,Point) , (Cards,Cards))

card :: IO Int
card = randomIO >>= return.(`mod` 10).abs

takeCard 0 = return []
takeCard n = do
 num <- card
 (num:)<$>takeCard (n-1)

main :: IO ()
main = withSocketsDo $ do

    myCards'   <- takeCard 5
    yourCards' <- takeCard 5
    myCards    <- newIORef $ myCards'
    yourCards  <- newIORef $ yourCards'
    myPoint    <- newIORef 0
    yourPoint  <- newIORef 0
    let gameInfo = ((myPoint,yourPoint) , (myCards,yourCards))

    hSetBuffering stdout NoBuffering
    (server gameInfo ) `catch` (const $ putStrLn "Exception caught.")
    putStrLn "Connection closed."

server :: GameInfo -> IO ()
server info = do
    sock <- listenOn (PortNumber 8001)
    repeats (receive sock info)
    sClose sock

repeats :: Monad m => m Bool -> m () 
repeats x =
    x >>= (\x' -> if x' then (return ()) else repeats x)

receive :: Socket -> GameInfo -> IO Bool
receive sock info@((mP,yP),(mC,yC)) = do
    (h,host,port) <- accept sock
    hSetBuffering h LineBuffering
    yC' <- readIORef yC 
    hPutStr h "chose numbers :-> " >> hPrint h yC'

    msg <- hGetLine h
    if any (==read msg) yC'
     then do
           upDate (read msg) yC
           k <- randomIO
           upDate k mC

           mC' <- readIORef mC
           addPoint mP yP$ (read msg) - (mC' !! k `mod` length mC')

           showGameState h info

           print ""

           putStrLn msg
           hPutStrLn h $ reverse msg 
           return $ null msg
     else return False
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

showGameState h ((mP,yP),(mC,yC)) = do
 mP' <- readIORef mP
 yP' <- readIORef yP
 yC' <- readIORef yC

 hPutStrLn h $ "points of Player   :: " ++ show yP'
 hPutStrLn h $ "points of computer :: " ++ show mP' ++ "\n"
