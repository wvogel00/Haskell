data ComplexNum = ComplexNum Float Float

instance Num ComplexNum where
	(ComplexNum a aj) + (ComplexNum b bj) = ComplexNum (a+b) (aj+bj)
	(ComplexNum a aj) - (ComplexNum b bj) = ComplexNum (a-b) (aj-bj)
	(ComplexNum a aj) * (ComplexNum b bj) = ComplexNum (a*b-aj*bj) (a*bj+aj*b)
	negate (ComplexNum x y) = ComplexNum (negate x) (negate y)
	abs (ComplexNum x y) = ComplexNum (sqrt $ x^2+y^2) 0
	signum (ComplexNum _ _) = ComplexNum 1 1
	fromInteger x = ComplexNum (fromInteger x) 0

instance Show ComplexNum where
	show (ComplexNum x y) = show x ++ "+" ++ show y ++ "i"
