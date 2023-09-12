module Lesson3Tuples where

-- TODO: Make another exercise!

-- TODO: Move me

caII_8542 :: (String, Float)
caII_8542 = ("Calcium II 8542", 8542)

heI :: (String, Float)
heI = ("Helium I", 10830)

feI :: (String, Float)
feI = ("Iron I", 6302)

ha :: (String, Float)
ha = ("Hydrogen Alpha", 6562)

spectralLines :: [(String, Float)]
spectralLines =
  [caII_8542, heI, feI, ha]

-- Destructuring = Pattern Matching
name :: (String, Float) -> String
name (n, _) = n

wavelength :: (String, Float) -> Float
wavelength (_, wl) = wl

-- TODO: exercise last person's name
-- return "None" if empty
-- hint: drop, length, where
lastPersonsName :: [(String, Int)] -> String
lastPersonsName = error "TODO:"
