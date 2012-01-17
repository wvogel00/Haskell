{-# Language TemplateHaskell , QuasiQuotes ,FlexibleContexts #-}

import Text.Peggy

data Script
 = Mes   {name     ::String,
          sentence ::String}
  |Img  {layer    ::Int,
         x        ::Int,
         y        ::Int,
         filepath ::String}
  |Sound {filepath ::String,
          isOn     ::Bool}
  deriving (Show)
[peggy|
scripts :: [Script]
 =  script* !.	--0個以上のスクリプト

script :: Script
 = "mes(" parseMes ");"    { $1 }
 / "img(" parseImg ");"    { $1 }
 / "music(" parseMusic ");"{ $1 }

parseMes :: Script
 = scString "," scString { mesScr $1 $2 }

parseImg :: Script
 = num "," num "," num "," scString { imgScr $1 $2 $3 $4 }
 / num "," scString                 { img1Scr $1 $2 }
 / scString                         { img2Scr $1 }

parseMusic :: Script
 = scString "," scMusicBool { soundScr $1 $2 }

scMusicBool :: Bool
 = "on"  { True }
 / "off" { False }

scString ::: String
 = '\"' scChar* '\"'

scChar :: Char
 = [0-9a-zA-Z._]

num ::: Int
 = [1-9] [0-9]* {read ($1 : $2)}
 / [0]          {0}
|]

mesScr a b = Mes {name = a , sentence = b}
imgScr a b c d = Img {layer = a,x = b,y = c,filepath = d}
img1Scr a b    = Img {layer = a,x = 0,y = 0,filepath = b}
img2Scr a      = Img {layer = 0,x = 0,y = 0,filepath = a}
soundScr a b = Sound {filepath = a , isOn = b}

text =  "img(1,10,10,\"Vogel.png\");mes(\"Vogel\",\"hello!\");"
main = print . parseString scripts "stdin" =<< getLine
