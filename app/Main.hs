module Main where

main = do
  putStrLn "Type your name"
  l <- getLine
  putStrLn $ "Hello, " <> l

add a b = a + b

triple x = x * 3

area r = pi * r ^ 2
