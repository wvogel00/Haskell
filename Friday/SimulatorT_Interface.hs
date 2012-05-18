module SimulatorT_Interface where
import System.Random
import Data.Time.Clock

type Time = Double
type Packet = (Time,Time,Time,Bool)
type Capacity = Int
type Queue = [Packet]
type System = (Capacity,(Double,Double),Queue,Time)
type Info = (System,Packet,Time,Int,Int)

data State = CallOfLoss | EnQueue | Process deriving Eq

mkRandoms seed = randomRs (0.0,1.0) $ mkStdGen seed -- 乱数リスト

capacity (c,_,_,_) = c
parameter (_,lm,_,_) = lm
queue (_,_,q,_) = q
now (_,_,_,time) = time

arrive (at,_,_,_) = at
service (_,st,_,_) = st
escape (_,_,et,_) = et

state :: Info -> State
state (system,p,_,_,_)
	| arrive p == now system
		&& length (queue system) == capacity system = CallOfLoss
	| arrive p == now system || queue system == [] = EnQueue
	| otherwise = Process

mkPacket time (l,m) r1 r2 = (arrive,service,escape,isPriority) where
	(arrive,service) =(time-log(1-r1)/l , -log(1-r2)/m)
	escape = arrive + service
	isPriority = r1 < 1/50

input :: IO (Info,Time,Time,[Double])
input = do
        putStrLn "lambda, mu, capacity, start, finish ->"
        (param,capa,st,ft) <-(getLine >>= return.format.words)
        t <- (getCurrentTime >>= return.utctDayTime)
        let
		(r1:r2:rndList) = mkRandoms.floor.read.init.show $t
		system = (capa,param,[],st)
		packet = mkPacket st param r1 r2
        return ((system,packet,0,0,0),st,ft,rndList) where
	format :: [String] -> ((Double,Double),Int,Time,Time)
	format [l,m,capa,st,ft]
		 = ((read l,read m),read capa,read st, read ft)

output measuredTime (system,p,wwt,b,n) = do
        print $ system
        putStrLn $ "call of loss == " ++ show callofloss
        putStrLn $ "average of packets = " ++ show (wwt/measuredTime)
        putStrLn $ "average of waiting time = " ++ show avgWaiting where
        callofloss = fromIntegral b / fromIntegral n
        avgWaiting = wwt / fromIntegral n
