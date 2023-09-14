module Lesson1Basics where

-- TODO: type these in main or REPL

-- Expressions and Parentheses
a = 1 + 2
b = 1 + 2 + 3
c = 1 + 2 * 3
d = (1 + 2) * 3

add x y = x + y

triple x = x * 3

-- operators are functions!
-- x `add` 3
add2 x y = (+) x y

-- Nested parentheses
fancyCalculation =
  triple (add (add 5 6) 10)

-- Avoid nested parens with `$`
fancyCalculation2 =
  triple $ add (add 5 6) 10

-- Intermediate results with `let/in`
fancyCalculation3 =
  let x = add 5 6
      y = add x 10
   in triple y

-- Local functions with `where`
count3Times n = inc $ inc $ inc n
 where
  inc x = x + 1

-- TODO: Exercise: Calculate the volume of a glass half full
-- hint - cylinder volume = cross section area * height
-- hint - break it down with where or let
-- hint - start with smallest piece of the problem = area of circle
glassHalfFull r h = error "TODO: glassHalfFull"

--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-- DONE: Solutions
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
