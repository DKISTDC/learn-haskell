module Lesson2ListsEtc where

-- :type 'a'
-- :type "hello"
-- :type main

-- Types! Strings are [Char]
greet :: String -> String
greet name = "Hello " ++ name

message :: String
message = greet "World"

-- Prelude
-- :t head
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

pad ns = ' ' : ns

pad0 ns = 0 : ns

-- IO and do notation
main1 :: IO ()
main1 =
  putStrLn message

main2 :: IO ()
main2 = do
  putStrLn "Hello"
  putStrLn "World"

main3 :: IO ()
main3 = do
  putStrLn british
  putStrLn frustrated
  -- breathe -- why doesn't this work?
  print cutoff -- why not putStrLn? :t putStrLn
  putStrLn abbreviated

main4 :: IO ()
main4 = do
  putStrLn "Enter your name:"
  name <- getLine
  let suspicious = "'" ++ name ++ "'"
  putStrLn $ greet suspicious ++ ", if that is really your name"

john :: (String, Int)
john = ("John", 40)

sara :: (String, Int)
sara = ("Sarah", 28)

people :: [(String, Int)]
people =
  -- Show head, drop
  [john, sara, ("Alice", 54), ("Carl", 33)]

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

lastPersonsName' hs =
  lastName $ drop (length hs - 1) hs
 where
  lastName (p : _) = name p
  lastName [] = "None"
