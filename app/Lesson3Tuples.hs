module Lesson3Tuples where

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

-- Destructuring = Pattern Matching
ion :: (String, Float) -> String
ion (n, _) = n

wavelength :: (String, Float) -> Float
wavelength (_, wl) = wl

-- TODO: exercise last wavelength
-- return "None" if empty
-- hint: drop, length, where
lastWavelength :: [(String, Float)] -> Float
lastWavelength = error "TODO:"

type Wavelength = Float
type Ion = String
type SpectralLine = (Ion, Wavelength)

-- Recursion, keep it simple
wavelengths :: [SpectralLine] -> [Wavelength]
wavelengths [] = []
wavelengths (a : as) = wavelength a : wavelengths as

ions :: [SpectralLine] -> [Ion]
ions [] = []
ions (a : as) = ion a : ions as

-- what's different here?
-- just 'ion a'
props :: (SpectralLine -> a) -> [SpectralLine] -> [a]
props prop as = go as
 where
  go [] = []
  go (a : as) = prop a : go as

-- :type map
wavelengths2 as = map wavelength as
ions2 as = map ion as

-- TODO: exercise: play with map and filter, sum, maximize, find?
-- name of the closest ion
--
