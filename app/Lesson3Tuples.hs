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
  -- Show head, drop
  [caII_8542, sara, ("Alice", 54), ("Carl", 33)]

-- Destructuring = Pattern Matching
name :: (String, Int) -> String
name (n, _) = n

age :: (String, Int) -> Int
age (_, a) = a

-- Pattern matching
cutoffSafe :: String -> Char
cutoffSafe "" = ' '
cutoffSafe (c : _) = c

headSafe :: a -> [a] -> a
headSafe def [] = def
headSafe _ (a : _) = a

cutoffSafe2 as = headSafe ' ' as

-- TODO: exercise last person's name
-- return "None" if empty
-- hint: drop, length, where
lastPersonsName :: [(String, Int)] -> String
lastPersonsName = error "TODO:"
