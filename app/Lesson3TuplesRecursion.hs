module Lesson3TuplesRecursion where

import Data.List

-- * Tuples: unlike lists, we know that these data exist
caII_854 :: (String, Float)
caII_854 = ("Calcium II 8542", 8542)

heI :: (String, Float)
heI = ("Helium I", 10830)

feI :: (String, Float)
feI = ("Iron I", 6302)

ha :: (String, Float)
ha = ("Hydrogen Alpha", 6562)

spectralLines :: [(String, Float)]
spectralLines =
  [caII_854, heI, feI, ha]

-- * Destructuring = Pattern Matching
name :: (String, Float) -> String
name (n, _) = n

wavelength :: (String, Float) -> Float
wavelength (_, wl) = wl

-- TODO: find the wavelength of the last spectral line in the list
-- return 0 if empty
-- hint: drop, length, where
lastWavelength :: [(String, Float)] -> Float
lastWavelength sls = error "TODO"

-- * type aliases!
type Wavelength = Float
type LineName = String
type SpectralLine = (LineName, Wavelength)

-- * Simple Recursion!
wavelengths :: [SpectralLine] -> [Wavelength]
wavelengths [] = []
wavelengths (sl : sls) = wavelength sl : wavelengths sls

lineNames :: [SpectralLine] -> [LineName]
lineNames [] = []
lineNames (sl : sls) = name sl : lineNames sls

-- what's different between the two?
-- just 'wavelength x'
props :: (SpectralLine -> a) -> [SpectralLine] -> [a]
props _ [] = []
props f (a : as) = f a : props f as

-- `prop` is the same as `map`
-- :type map
wavelengths2 as = map wavelength as
lineNames2 as = map name as

-- `filter` items from a list
linesBelow :: Wavelength -> [SpectralLine] -> [SpectralLine]
linesBelow wl lines =
  filter (\sl -> wavelength sl < wl) lines

-- Maybe (Optional) is like list with 0 or 1 items, or a nullable value
message :: Maybe String
-- message = Nothing
message = Just "hello"

-- We can make a version of headSafe (Lesson 2) that makes the caller handle missing values
headSafe :: [a] -> Maybe a
headSafe [] = Nothing
headSafe (a : _) = Just a

-- TODO: identify the spectral line, matches if within 10 angstroms
-- hint: Data.List module?
-- hint: headSafe?
identifyLine :: Wavelength -> [SpectralLine] -> Maybe SpectralLine
identifyLine wl lines = error "TODO"

-- Alternatively, use custom if/else logic with guards
identifyLine' :: Wavelength -> Maybe SpectralLine
identifyLine' wl
  | 8535 <= wl && wl <= 8550 = Just caII_854
  | 6297 <= wl && wl <= 6305 = Just feI
  | distance wl heI <= 10 = Just heI
  | distance wl ha <= 10 = Just ha
  | otherwise = Nothing
 where
  distance wl line = abs $ wavelength line - wl

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
-- DONE: solutions

lastWavelength2 :: [(String, Float)] -> Float
lastWavelength2 sls =
  getWavelength $ drop (length sls - 1) sls
 where
  getWavelength [p] = wavelength p
  getWavelength _ = 0

identifyLine2 :: Wavelength -> [SpectralLine] -> Maybe SpectralLine
identifyLine2 wl lines =
  find (within10Angstroms wl) lines
 where
  distance wl line = abs $ wavelength line - wl
  within10Angstroms wl line = distance wl line <= 10
