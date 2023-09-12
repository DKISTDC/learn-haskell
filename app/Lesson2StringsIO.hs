module Lesson2StringsIO where

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

-- Cons operator! It's a linked list
-- numbers2 = 1 : (2 : (3 : (4 : (5 : []))))
numbers2 :: [Integer]
numbers2 = 1 : 2 : 3 : 4 : 5 : []

pad :: String -> String
pad ns = ' ' : ns

pad0 :: [Integer] -> [Integer]
pad0 ns = 0 : ns

-- IO and do notation
main1 :: IO ()
main1 =
  putStrLn message

main2 :: IO ()
main2 = do
  putStrLn "Hello"
  putStrLn "World"
  return ()

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

-- Pattern matching
chatAI :: [String] -> String
chatAI ["hi"] = "Hello there!"
chatAI ["hello"] = "Hello there!"
chatAI ["flip", s] = reverse s
chatAI ("secret" : _) = "Ok, I'll keep your secret!"
chatAI msg =
  -- Case statement!
  case msg of
    [] -> "Are you still there?"
    ("skip" : rest) -> chatAI rest
    _ -> "I do not understand: " ++ concat msg

-- :t words
mainChat :: IO ()
mainChat = do
  msg <- getLine
  putStrLn $ chatAI $ words msg
  mainChat

-- TODO: Exercise: commands!
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
  _ <- getLine
  error "TODO mainCommands"
