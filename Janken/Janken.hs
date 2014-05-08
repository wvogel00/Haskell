data Hand = G | C | H
data Player = Human | Computer
data Perceptron = Perceptron{ws :: [[Double]]}

input 'g' = G
input 'c' = C
input 'h' = H

G win C = Human
C win G = Computer
G win H = Human
H win G = Computer
H win C = Human
C win H = Computer

initPerceptron = Perceptron{ws = replicate 3 $ replacate 3 0.0}

w .*. a = sum.map (uncurry (*)) $ zip w a
k .* a = map (*k) a

phi x y = [x,y,1]
predict w x y = w .*. (phi x y)

update w x y = if predict != t then w + t .* phi

main = do
	putStrLn "janken! g,c,h..."
	let hand = perceptron
	c <- getChar
	let score = (input c) `win` hand
	case score of
		Computer -> main
		Human -> update perceptron >> main
