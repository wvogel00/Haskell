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
	systemC = (capacity sy,parameter sy,queue sy,
			nextTime sy $ newPacket (now sy) sy rs)

    EnQueue    -> (systemE, newPacket (now sy) sy rs, wwt,b,n+1) where
	systemE = (capacity sy,parameter sy,queue sy++[p],
			nextTime sy $ newPacket (now sy) sy rs)

    Process    -> (systemP, p, wwt+stayTime, b, n) where
	systemP = (capacity sy,parameter sy,tail$queue sy,nextTime sy p)
	stayTime = now sy - arrive (head $ queue sy)
--パケットを生成する
newPacket time sy (r1,r2) = mkPacket time (parameter sy) r1 r2
--次回イベント時刻を求める
nextTime sy = min (escapeTime sy).arrive
escapeTime sy = if queue sy/=[] then escape.head $queue sy else 10^10
