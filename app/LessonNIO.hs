module LessonNIO where

-- Types! Strings are [Char]
greet :: String -> String
greet name = "Hello " ++ name

message :: String
message = greet "World"

-- IO and do notation
main1 :: IO ()
main1 =
  putStrLn message

main2 :: IO ()
main2 = do
  putStrLn "Hello"
  putStrLn "World"
  return ()

-- main3 :: IO ()
-- main3 = do
--   putStrLn british
--   putStrLn frustrated
--   -- breathe -- why doesn't this work?
--   print cutoff -- why not putStrLn? :t putStrLn
--   putStrLn abbreviated
--
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

main4 :: IO ()
main4 = do
  putStrLn "Enter your name:"
  name <- getLine
  let suspicious = "'" ++ name ++ "'"
  putStrLn $ greet suspicious ++ ", if that is really your name"

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
  cmd <- getLine
  case words cmd of
    ["quit"] -> return ()
    ("concat" : rest) -> putStrLn $ concat rest
    ["count", a] -> print $ length a
    ("count" : rest) -> print $ length rest
    _ -> mainCommands
