data Hand = G | C | H
data Perceptron = Perceptron{ws :: [[Double]], next :: Hand}

input 'g' = G
input 'c' = C
input 'h' = H

G win C = -1
C win G =  1
G win H = -1
H win G =  1
H win C = -1
C win H =  1
_ win _ =  0

initPerceptron = Perceptron{ws = replicate 3 $ replacate 3 0.0}

initialize :: Perceptron -> IO Perceptron
initialize

w .*. a = sum.map (uncurry (*)) $ zip w a
k .* a = map (*k) a

phi x y = [x,y,1]
predict w x y = w .*. (phi x y)

update w x y = if predict != t then w + t .* phi

main = initialize initPerceptron >>= janken

janken :: Perceptron -> IO ()
janken p = do
	putStrLn "janken! g,c,h..."
	let hand = next perceptron
	c <- getChar
	let score = (input c) `win` hand
	janken $ update perceptron score
