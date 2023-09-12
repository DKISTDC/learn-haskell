Outline
=======

Download and Install
* Clone repo
* GHCUP, cabal, haskell-language-server

Why Haskell?
* Code Fearlessly
* Type System
* Composition

Lesson1: Basics
* expressions: (2 + 3)
* parentheses: (2 + 3) * 4
* REPL / Reload
* functions: add, triple
* parentheses: fancyCalculation
* let/in: fancyCalculations
* where: count3Times
* Exercise

Lesson2: Printing Strings
* Lists of characters, type alias
* Printing, Hello World!
* (++), concat
* head, tail, take, drop
* IO / putStrLn, do
IO - do notation
* putStrLn / getLine
* pure expressions with let
* Tuples

Data Types
* ADTs
* Bool
* Tuples
* Domain-specific?
* Maybe
* Pattern matching / destructuring
* Sum / Product types

Functional Programming
* Recursion
* Partial Application, Currying

Typeclasses
* Interfaces
* :info Eq
* :info Num
* Enum, Ord
* Show

Anonymous functions?
Case expressions?
Higher order functions
Guards
Function Composition with (.)

Recursion! Way down here
* factorial
* fibbonaci

Lists - again
* Finally goes into map
* filter
* zip

Folds 
* foldl
* scanl














Following: Haskell Programming from First Principles
----------------------------------------------------

INTRO
* Download and install
* Cabal repl
* Functions: triple x = x * 3
* Exercise: write a function: area of circle, then use constant pi
* Operators (+, *, `div`), (+) as a prefix
* Declare values with let/in
  * Can't put expressions at top-level
* Exercise: fix compile errors in module (floating expression, let, typos)
* Negative numbers
* `$` operator
* `where`

TYPES & STRINGS
* Understand string
* :type 'a'
* :type "Hello"
* print "Hello world!"
* putStrLn "Hello World!"
* main function with IO annotation, run it
* :set prompt "λ> "
* :r
* repl = IO
* "Hello" ++ " World!" (<>)?
* concat `[ hello, " ", world ]`
* :t (++)
* Showing how where's aren't available in other functions?
* List stuff: head, tail, take, drop, (!!)
* New modules

DATA TYPES
* ADT
* Comparisons
* Bool
* if/else
* Tuples
* Lists
* Variable conventions
* Term level vs Type Level
* Type alias




EXERCISES
=========


Instructions
Given a year, report if it is a leap year.

The tricky thing here is that a leap year in the Gregorian calendar occurs:

on every year that is evenly divisible by 4
  except every year that is evenly divisible by 100
    unless the year is also evenly divisible by 400
For example, 1997 is not a leap year, but 1996 is. 1900 is not a leap year, but 2000 is.
