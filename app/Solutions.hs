module Solutions where

-- NOTE: LESSON 1: Basics
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

-- NOTE: LESSON 2: Lists, etc
-- DONE: exercise last person's name
-- return "None" if empty
-- hint: drop, length, where
lastPersonsName :: [(String, Int)] -> String
lastPersonsName = error "TODO:"

lastPersonsName' hs =
  lastName $ drop (length hs - 1) hs
 where
  lastName (p : _) = name p
  lastName [] = "None"

  name (n, _) = n
