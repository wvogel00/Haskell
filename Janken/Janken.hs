data Hand = G | C | H deriving Show

--学習率
alpha = 0.3

input 'g' = G
input 'c' = C
input 'h' = H

--ジャンケンの結果得られる報酬
win G C = -1
win C G =  1
win G H =  1
win H G = -1
win H C =  1
win C H = -1
win _ _ = -0.3

--報酬の推定値が最も大きいものを次の手とする
next w@[g,c,h]
	| g >= c && g >= h = G
	| c >= g && c >= h = C
	| h >= g && h >= c = H

at [g,_,_] G = g
at [_,c,_] C = c
at [_,_,h] H = h

--出した手の良し悪しで学習
update ws@[g,c,h] score hand = put hand where
	w = ws `at` hand + alpha*(score - ws `at` hand)
	put G = [w,c,h]
	put C = [g,w,h]
	put H = [g,c,w]

winner  1 = "PC"
winner (-1) = "You"
winner  _ = "Draw"

initWs = [0,0,0] :: [Double]

main = janken initWs 0

janken :: [Double] -> Int -> IO ()
janken ws 100 = return ()
janken ws n = do
	putStrLn "janken! g,c,h..."
	let hand = next ws
	c <- getChar
	let score = (input c) `win` hand
	print ws
	print $ ":::" ++ show hand ++ ":::" ++ winner score
	janken (update ws score hand) (n+1)
