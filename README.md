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

Manage installed versions of binaries in a Terminal User Interface

    > ghcup tui

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


Editor Integration
------------------

_(Follow installation instructions first. You should be able to run `ghcup`, `ghci`, and `cabal` in your terminal)_

[Visual Studio Code](https://code.visualstudio.com/)

  * Install [Haskell Extension](https://marketplace.visualstudio.com/items?itemName=haskell.haskell)
    * Click Extensions
    * search "Haskell"
    * Install

[Neovim](https://neovim.io/)

  * Install [haskell-tools.nvim](https://github.com/mrcjkb/haskell-tools.nvim)


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

