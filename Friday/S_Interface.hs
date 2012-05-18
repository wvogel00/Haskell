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

mkPacketD s r1 r2 = Packet {
  arrive        = now s + arrive' r1 s,
  service       = 2.0,
  escape        = now s + arrive' r1 s + service' r2 s,
  firstPriority = isPriority r1
}

mkPacketM s r1 r2 = Packet {
  arrive        = now s+arrive' r1 s,
  service       = service' r2 s,
  escape        = now s + arrive' r1 s + service' r2 s,
  firstPriority = isPriority r1
 }

isPriority r  = if r < 1/60 then True else False
arrive'  r s  = -log (1-r)/(fst $ param s)
service' r s  = -log (1-r)/(snd $ param s)
