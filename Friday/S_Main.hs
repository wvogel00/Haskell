import S_I
import Data.Time.Clock

input :: IO ((Double,Double),Int,Time,Time,Int)
input = do
 putStrLn "lambda :->"
 l <- getLine
 putStrLn "mu :->"
 m <- getLine
 putStrLn "capacity :->"
 c <- getLine
 putStrLn "start :->"
 st <- getLine
 putStrLn "finish :->"
 ft <- getLine
 t <- getCurrentTime
 print $ utctDayTime t
 let seed  = floor.read.init.show $ utctDayTime t
 return ((read l,read m), read c, read st, read ft, seed)

output measuredTime (system,p,wwt) = do
 print $ system
 putStrLn $ "call of loss == " ++ show callofloss
 putStrLn $ "average of packets in system = " ++ show (wwt/measuredTime)
 putStrLn $ "average of waiting time = " ++ show (wwt/n)
 where
  callofloss = (\(b,n)->fromIntegral b/fromIntegral n) $counter system
  n = fromIntegral $ snd $ counter system

main = do
 d@(param,capacity,start,finish,seed) <- input
 let (r1:r2:randomList) = seedList seed
     initSystem = mkInit d
     fstPacket = mkPacketM initSystem r1 r2
 output (start-finish) . (simulator finish) (initSystem,fstPacket,0)
    $randomList where
  mkInit (lm,c,st,_,_) = System {
   param = lm, capa = c, counter = (0,0), queue = [], now = st
  }

simulator ft info@(system,p,wwt) (r1:r2:rs) = if now system >= ft
 then info else (simulator ft) (update info r1 r2 $ state info) rs

state (s,p,_)
 | queue s == [] = EnQueue
 | length (queue s) > capa s = CallOfLoss
 | length (queue s)== capa s
    && arrive p < (escape.head$ queue s) = CallOfLoss
 | (escape.head$ queue s) <arrive p = Process
 | arrive p == now s = EnQueue
 | otherwise = Process

nextNow p s =  if queue s == []
 then arrive p else min (arrive p) (escape.head$ queue s)

udPacket p = Packet {
 arrive = arrive p,service = service p,
 firstPriority = firstPriority p, escape = arrive p + service p
 }

update (s,p,wwt) r1 r2 CallOfLoss = (System {
	param = param s,capa = capa s,
	counter = (\(b,n)->(b+1,n+1)) $ counter s,queue = queue s,
	now = nextNow (mkPacketM s r1 r2) s
	}, mkPacketM s r1 r2, wwt)
update (s,p,wwt) r1 r2 EnQueue = (System {
	param = param s, capa = capa s, queue = queue',
	counter = (\(b,n)->(b,n+1))$ counter s,
	now = nextNow (mkPacketM s r1 r2) s
	}, mkPacketM s r1 r2, wwt) where
    queue' = queue s ++[p]
update (s,p,wwt) r1 r2 Process
 | length (queue s) == 1 = (System {
  param = param s, capa = capa s,counter = counter s,
  queue = [], now = arrive $ mkPacketM s r1 r2
  },mkPacketM s r1 r2, wwt+now s - arrive (head $ queue s))
 | otherwise = (System {
	param = param s,capa = capa s,counter = counter s,
	queue = (\(np:ps) -> udPacket np:ps) $tail $ queue s,
        now = nextNow p s
	}, p, wwt+now s-arrive(head$queue s))
