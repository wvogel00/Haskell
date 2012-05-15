import Graphics.Gloss

main = animate (InWindow "Animate Test" (600,400) (20,100)) cyan drawFunc
 where
  drawFunc _ = Translate (-150) 50 $ Rotate 30 $ Text "Hello!"
