module Calender where

import Data.Maybe
import Interface

--曜日
data DayOfWeek = Sun | Mon | Tue | Wed | Thu | Fri | Sat
                                     deriving (Eq,Enum,Show)

months :: [Month]
months = [1..12]

--年と月から、日数を計算
days :: (Year,Month) -> [Day]
days(y,m)
 | m == 2 = if isLeap y then [1 .. 29] else [1 .. 28]
 | any (==m) [1,3,7,8,10,12] = [1 .. 31]
 | any (==m) [2,4,6,9,11]    = [1 .. 30]

dayOfWeekTouples = zip [0..7] [Sun .. Sat]

--閏年の判定
isLeap :: Year -> Bool
isLeap = \year -> year `mod` 4 == 0

--Zellerの公式から曜日計算
dayOfWeek :: Date -> DayOfWeek
dayOfWeek (y,m,d) = fromJust $ lookup (mod k 7) dayOfWeekTouples
 where
  k =  y + y`div`4 - y`div`100 +y`div`400 + (13*m+8)`div`5 + d


