module Lesson4DataTypes where

-- Algebraic Data Types!

-- Sum types: like enums
-- compare Lesson3: type LineName = String
data Element = He | H | Fe | Ca

-- This is how bool is defined
data Bool' = True' | False'

-- Product types: combine different data
-- compare to tuples in Lesson3: feI :: (String, Float)
type Wavelength = Float
data SpectralLine = SpectralLine Element Wavelength

lines :: [SpectralLine]
lines = [heI, feI, ha, caII_854]
 where
  heI = SpectralLine He 10830
  feI = SpectralLine Fe 6302
  ha = SpectralLine H 6562
  caII_854 = SpectralLine Ca 8542

-- We can combine the two to handle complex states!
data HasElement = None | Has Element

-- (Note: this is exactly how Maybe works, just with a type variable)
-- data Maybe a = Nothing | Just a

-- *** MAKE IMPOSSIBLE STATES IMPOSSIBLE! ***

-- Example 1. Wait, are we working in Angstroms or Nanometers?
pleaseDontCallWithAngstroms :: Wavelength -> Float
pleaseDontCallWithAngstroms = error "Could be off by a factor of 10"

newtype Nanometers = Nanometers Float
photonEnergy :: Nanometers -> Float
photonEnergy (Nanometers wl) = h * c / wl
 where
  h = 6.626 * 10 ^ (-34)
  c = 2.998 * 10 ^ 8

-- Example 2. How to model the CaII Triplet?
data CaIILine
  = CaII_849
  | CaII_852
  | CaII_866

-- Not all elements have a CaIILine, only Ca does
data SpectralLineBad = SpectralLineBad Element CaIILine

-- Let's make it a Maybe! Is this right?
data SpectralLineBad2 = SpectralLineBad2 Element (Maybe CaIILine)

badLineName :: SpectralLineBad2 -> String
-- Pattern matches non-exhaustive!
-- what is the name of He (Just CaII_849)?
-- what is the name of Ca Nothing?
badLineName (SpectralLineBad2 He Nothing) = "Helium"
badLineName (SpectralLineBad2 H Nothing) = "Hydrogen"
badLineName (SpectralLineBad2 Fe Nothing) = "Iron"
badLineName (SpectralLineBad2 Ca (Just CaII_849)) = "Calcium 849"
badLineName (SpectralLineBad2 Ca (Just CaII_852)) = "Calcium 849"
badLineName (SpectralLineBad2 Ca (Just CaII_866)) = "Calcium 849"

-- Better: create an ADT that models the states exactly
data SpectralLine'
  = HeliumI
  | HydrogenAlpha
  | IronI
  | CalciumII CaIILine

lines' :: [SpectralLine']
lines' =
  [ HeliumI
  , HydrogenAlpha
  , IronI
  , CalciumII CaII_849
  , CalciumII CaII_852
  , CalciumII CaII_866
  ]

-- Instead of putting the wavelength and element in the datatype, now we can calculate it from the Line
-- Impossible to represent Helium + a calcium band
-- Or calcium without one
element :: SpectralLine' -> Element
element HeliumI = He
element HydrogenAlpha = H
element IronI = Fe
element (CalciumII _) = Ca

wavelength :: SpectralLine' -> Float
wavelength HeliumI = 10830
wavelength HydrogenAlpha = 6562
wavelength IronI = 6302
wavelength (CalciumII CaII_849) = 8498
wavelength (CalciumII CaII_852) = 8542
wavelength (CalciumII CaII_866) = 8662
