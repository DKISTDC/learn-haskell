Installation
------------

* Clone this repo: https://github.com/dkISTDC/learn-haskell

Install [GHCUP](https://www.haskell.org/ghcup/):

    > curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

Make sure ghcup is on your path by running the following. (If not, you need to modify your .bashrc to add `~/.ghcup/bin` to your PATH)

    > ghcup --version

Install GHC, the "Glasgow Haskell Compiler"

    > ghcup install ghc

Install Cabal, the Haskell package manager

    > ghcup install cabal

Install Haskell Language Server, which provides LSP support (IDE support for Visual Studio Code, Vim, and others)
  
    > ghcup install hls

Running Haskell Code
--------------------

Run an interactive REPL outside of a project folder

    > ghci
    ghci> "hello"
    "hello"
    
Load a local file,
  
    ghci> :load app/Main.hs

Reload loaded files

    ghci> :reload
    ghci> :r

Run an interactive REPL inside a project folder (like this repository). This will load code dependencies and your Main.hs file.

    > cabal repl
    ghci> main
    ghci> :r
    ghci> main

Other useful cabal commands

    > cabal run
    > cabal build
    > cabal test


Outline
-------

Why Haskell?
* Code Fearlessly
* Type System
* Composition

[Lesson 1: Basics](./app/Lesson1Basics.hs)

[Lesson 2: Lists, Types, and Patterns](./app/Lesson2ListsPatternsTypes.hs)

[Lesson 3: Tuples and Recursion](./app/Lesson3TuplesRecursion.hs)

[Lesson 4: Data Types](./app/Lesson4DataTypes.hs)

