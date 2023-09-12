module Solutions where

-- DONE:: Exercise: Calculate the volume of a glass half full
-- hint - cylinder volume = cross section area * height
-- hint - break it down with where or let
-- hint - start with smallest piece of the problem = area of circle
glassHalfFull _r _h = error "TODO: glassHalfFull"

glassHalfFullLet r h =
  let area = pi * r ^ 2
      vol = area * h
   in 0.5 * vol

glassHalfFullWhere r h =
  volume r h * 0.5
 where
  area r = pi * r ^ 2
  volume r h = area r * h

glassHalfFullLib r h =
  cylinderVolume r h * 0.5

circleArea r = pi * r ^ 2

cylinderVolume r h = circleArea r * h

-- DONE: exercise last person's name
-- return "None" if empty
-- hint: drop, length, where
lastPersonsName :: [(String, Int)] -> String
lastPersonsName hs =
  lastName $ drop (length hs - 1) hs
 where
  lastName (p : _) = name p
  lastName [] = "None"

  name (n, _) = n

-- DONE: Exercise: commands!
-- quit: does nothing, stops
-- concat a b c: concatenate strings
-- count a: counts the number of characters in the word
-- count a b c: count the number of words
-- otherwise, repeat

-- hint: case statement, or where function w/ pattern match
-- hint: print

mainCommands :: IO ()
mainCommands = do
  putStrLn "Enter a command"
  cmd <- getLine
  case words cmd of
    ["quit"] -> return ()
    ("concat" : rest) -> putStrLn $ concat rest
    ["count", a] -> print $ length a
    ("count" : rest) -> print $ length rest
    _ -> mainCommands
