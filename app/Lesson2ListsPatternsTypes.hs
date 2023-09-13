module Lesson2ListsPatternsTypes where

-- :type 'a'
-- :type "hello"
-- :type main
-- :type [1,2,3,4,5]
-- Types! Strings are [Char]

greet :: String -> String
greet name = "Hello " ++ name

message :: String
message = greet "World"

-- Prelude
-- :t head
-- type variables
cutoff = head message

-- :t drop
british = drop 1 message

frustrated = take 4 message

abbreviated = "'" ++ tail message

parts =
  let msg = "world"
      greeting = "hello"
      mood = "!"
   in concat [greeting, msg, mood]

numbers = [1, 2, 3, 4, 5]

secretNumber = take 2 $ drop 2 numbers

-- Cons operator! It's a linked list
-- numbers2 = 1 : (2 : (3 : (4 : (5 : []))))
numbers2 :: [Integer]
numbers2 = 1 : 2 : 3 : 4 : 5 : []

pad :: String -> String
pad ns = ' ' : ns

pad0 :: [Integer] -> [Integer]
pad0 ns = 0 : ns

-- Pattern matching
contar :: Integer -> String
contar 1 = "uno"
contar 2 = "dos"
contar 3 = "tres"
contar 4 = "quatro"
contar 5 = "cinco"
contar 0 = "cero"
contar _ = "No hablo español!"

contar' :: Integer -> String
contar' n =
  case n of
    1 -> "uno"
    2 -> "dos"
    3 -> "tres"
    4 -> "quatro"
    5 -> "cinco"
    0 -> "cero"
    _ -> "No hablo español!"

-- Pattern matching lists just like cons
cutoffSafe :: String -> Char
cutoffSafe "" = ' '
cutoffSafe (c : _) = c

-- make a useful function!
headSafe :: a -> [a] -> a
headSafe def [] = def
headSafe _ (a : _) = a

cutoffSafe2 as = headSafe ' ' as

-- TODO: make a highly sophisticated generative AI
--   hi -> hi!
--   hello -> hello there!
--   flip message -> egassem
--   count one two three -> 3
--   secret dogs are nice -> ok, I won't tell anyone
--   '' -> Are you still there?
--   <msg> -> "I'm sorry, I don't understand: <msg>"
-- hint: words
-- hint: where or case statement
-- hint: show
chatAI :: String -> String
chatAI msg = error "TODO"

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
chatAI' :: String -> String
chatAI' msg = respond $ words msg
 where
  respond :: [String] -> String
  respond ["hi"] = "Hello there!"
  respond ["hello"] = "Hello there!"
  respond ["flip", s] = reverse s
  respond ("count" : ss) = show $ length ss
  respond ("secret" : _) = "ok, I won't tell anyone"
  respond [] = "Are you still there?"
  respond msg = "I do not understand: " ++ concat msg
