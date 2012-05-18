import SimulatorT_Interface

main = do
	(info,st,ft,randoms) <- input
	output (ft-st)$ simulate ft info $randoms
--シミュレーションを再帰呼び出しで行う
simulate :: Time -> Info -> [Double] -> Info
simulate ft info@(s,p,wwt,b,n) (r1:r2:randoms) = if now s >= ft
	then info
	else simulate ft (update (r1,r2) info $state info) randoms
--イベント種類によってsystemを更新
update rs (sy,p,wwt,b,n) nowState = case nowState of
    CallOfLoss -> (systemC, newPacket (now sy) sy rs,wwt,b+1,n+1) where
	systemC = (capacity sy,parameter sy,queue',
		nextTime queue' $ newPacket (now sy) sy rs)
	queue' = queue sy

    EnQueue    -> (systemE, newPacket (now sy) sy rs, wwt,b,n+1) where
	systemE = (capacity sy,parameter sy,queue',
			nextTime queue' $ newPacket (now sy) sy rs)
	queue' = queue sy ++ [p]

    Process    -> (systemP, p, wwt+stayTime, b, n) where
	systemP = (capacity sy,parameter sy,queue',nextTime queue' p)
	stayTime = now sy - arrive (head $ queue sy)
	queue' = updateQueue (now sy) $ tail $ queue sy
--パケットを生成する
newPacket time sy (r1,r2) = mkPacket time (parameter sy) r1 r2
--次回イベント時刻を求める
nextTime q = min escapeTime.arrive where
	escapeTime = if q /=[] then escape $ head q else 10^10
--Queueの先頭パケットの離脱時間を更新
updateQueue _ [] = []
updateQueue time ((at,st,et,bool):ps) = (at,st,time+st,bool):ps
