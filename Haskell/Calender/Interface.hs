module Interface where

type Day = Int
type Month = Int
type Year = Int
type Date = (Year,Month,Day)

type Hour = Int
type Minute = Int
type Time = (Hour,Minute)
type Span = (Time,Time)

type Plan = (Span,String)
type Schedule = [Span]

width  = 800
height = 600
