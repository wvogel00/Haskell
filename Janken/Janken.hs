data Hand = G | C | H
data Player = Human | Computer

G win C = Human
C win G = Computer
G win H = Human
H win G = Computer
H win C = Human
C win H = Computer
