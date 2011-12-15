module Interface where

import Data.Time.Calendar

type Date = Int
type Month = Int
type Year = Int
type DateInfo = (Year,Month,Date)

type Hour = Int
type Minute = Int
type Time = (Hour,Minute)
type Span = (Time,Time)

type Schedule = (DateInfo,[Plan])
type Plan = (Span,String)

dayOfWeek = zip [0..6]
                ["sunday","monday","tuesday",
                 "wednesday","thursday","friday","saturday"]

width  = 800
height = 600

