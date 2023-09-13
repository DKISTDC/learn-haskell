module Lesson3TuplesRecursion where

import Data.List

-- * Tuples
caII_8542 :: (String, Float)
caII_8542 = ("Calcium II 8542", 8542)

heI :: (String, Float)
heI = ("Helium I", 10830)

feI :: (String, Float)
feI = ("Iron I", 6302)

ha :: (String, Float)
ha = ("Hydrogen Alpha", 6562)

spectralLines :: [(String, Float)]
spectralLines =
  [caII_8542, heI, feI, ha]

-- * Destructuring = Pattern Matching
ion :: (String, Float) -> String
ion (n, _) = n

wavelength :: (String, Float) -> Float
wavelength (_, wl) = wl

-- TODO: find the wavelength of the last spectral line in the list
-- return 0 if empty
-- hint: drop, length, where
lastWavelength :: [(String, Float)] -> Float
lastWavelength sls = error "TODO"

-- * type aliases!
type Wavelength = Float
type Ion = String
type SpectralLine = (Ion, Wavelength)

-- * Simple Recursion!
wavelengths :: [SpectralLine] -> [Wavelength]
wavelengths [] = []
wavelengths (sl : sls) = wavelength sl : wavelengths sls

ions :: [SpectralLine] -> [Ion]
ions [] = []
ions (sl : sls) = ion sl : ions sls

-- what's different between the two?
-- just 'ion a'
props :: (SpectralLine -> a) -> [SpectralLine] -> [a]
props prop as = go as
 where
  go [] = []
  go (a : as) = prop a : go as

-- :type map
wavelengths2 as = map wavelength as
ions2 as = map ion as

linesBelow :: Wavelength -> [SpectralLine] -> [SpectralLine]
linesBelow wl lines =
  filter (\sl -> wavelength sl < wl) lines

-- TODO: identify the spectral line, matches if within 10 angstroms
-- hint: Data.List.find
identifyLine :: Wavelength -> [SpectralLine] -> Maybe SpectralLine
identifyLine wl lines = error "TODO"

-- Custom if/else logic with guards
identifyLine' :: Wavelength -> Maybe SpectralLine
identifyLine' wl
  | 8535 <= wl && wl <= 8550 = Just caII_8542
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
