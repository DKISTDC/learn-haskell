module Exercises.Ion1 where

import Data.List qualified as L
import Data.Maybe

type Angstroms = Float

-- TODO: Not a good motivating example for data!
data SpectralLine = SpectralLine String Angstroms

spectralLines =
  [ SpectralLine "Hydrogen Alpha" 6562
  , SpectralLine "Helium I" 10830
  , SpectralLine "Iron I" 6302
  , SpectralLine "Calcium II 8452" 8452
  ]

isWithinBand :: Angstroms -> SpectralLine -> Bool
isWithinBand a (SpectralLine _ b) = abs (a - b) <= 10

spectralLineName :: Angstroms -> String
spectralLineName wl =
  case filter (isWithinBand wl) spectralLines of
    [] -> "None"
    ((SpectralLine name _) : _) -> name

spectralLineName' :: Angstroms -> Maybe String
spectralLineName' wl =
  case filter (isWithinBand wl) spectralLines of
    [] -> Nothing
    ((SpectralLine name _) : _) -> Just name

data Ion
  = HeI
  | Ha
  | FeI
  | CaII_8542

isIon :: Angstroms -> Ion -> Bool
isIon = undefined

findIon :: Angstroms -> Maybe Ion
findIon = undefined

identifyIons :: [Angstroms] -> [Ion]
identifyIons = undefined

ionName :: Ion -> String
ionName Ha = "Hydrogen Alpha"
ionName HeI = "Helium I"
ionName FeI = "Iron I"
ionName CaII_8542 = "Calcium II 8452"

wavelength :: Ion -> Angstroms
wavelength Ha = 6562
wavelength HeI = 10830
wavelength FeI = 6302
wavelength CaII_8542 = 8542

isIon' :: Angstroms -> Ion -> Bool
isIon' wl ion = wl - wavelength ion <= 10

findIon' :: Angstroms -> Maybe Ion
findIon' wl = headMay $ filter (isIon' wl) [HeI, Ha, FeI, CaII_8542]
 where
  headMay :: [a] -> Maybe a
  headMay [] = Nothing
  headMay (a : _) = Just a

findIon2 :: Angstroms -> Maybe Ion
findIon2 wl = L.find (isIon' wl) [HeI, Ha, FeI, CaII_8542]

findIon3 :: Angstroms -> Maybe Ion
findIon3 wl
  | isIon' wl HeI = Just HeI
  | isIon' wl Ha = Just Ha
  | isIon' wl FeI = Just FeI
  | isIon' wl CaII_8542 = Just CaII_8542
  | otherwise = Nothing

identifyIons' :: [Angstroms] -> [Ion]
identifyIons' = foldr addFoundIon []
 where
  addFoundIon wl is =
    case findIon' wl of
      Nothing -> is
      Just i -> i : is

identifyIons3 :: [Angstroms] -> [Ion]
identifyIons3 = mapMaybe findIon3

test :: IO ()
test = do
  let ions = identifyIons' [6523, 10831, 6302]
  print $ map ionName ions
