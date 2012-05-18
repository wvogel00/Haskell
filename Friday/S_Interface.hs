module S_Interface where

import System.Random

type Time = Double
type Info = (System,Packet,Time)

data State = EnQueue | CallOfLoss | Process deriving Eq
data Packet = Packet {
	arrive,service,escape :: Time,
	firstPriority         :: Bool
 } deriving (Eq,Show,Ord)
data System = System {
	param   :: (Double,Double),
	capa    :: Int,
	counter :: (Int,Int),
	queue   :: [Packet],
        now     :: Time
 } deriving (Show,Eq,Ord)

seedList seed = randomRs (0.0,1.0) (mkStdGen seed) -- 乱数リスト

mkPacketM s r1 r2 = Packet {
 arrive = now s+arrive', service = service',
 escape = now s+arrive'+service',firstPriority = isPriority
 } where
  isPriority = if r1 < 1/60 then True else False
  arrive'  = -log (1-r1)/(fst $ param s)
  service' = -log (1-r2)/(snd $ param s)
