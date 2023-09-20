{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE OverloadedRecordDot #-}
{-# LANGUAGE NoFieldSelectors #-}

module Lesson4DataTypes where

import Data.Time.Clock (UTCTime)

-- Algebraic Data Types!

-- Sum types: like enums
-- compare Lesson3: type LineName = String
data Element = He | H | Fe | Ca

-- This is how bool is defined
data Bool' = True' | False'

-- Product types: combine different data
-- compare to tuples in Lesson3: feI :: (String, Float)
type Wavelength = Float
data SpectralLine1 = SpectralLine1 Element Wavelength

lines :: [SpectralLine1]
lines = [heI, feI, ha, caII_854]
 where
  heI = SpectralLine1 He 10830
  feI = SpectralLine1 Fe 6302
  ha = SpectralLine1 H 6562
  caII_854 = SpectralLine1 Ca 8542

-- We can combine the two to handle complex states!
data HasElement = None | Has Element

-- (Note: this is exactly how Maybe works, just with a type variable)
-- data Maybe a = Nothing | Just a

-- *** MAKE IMPOSSIBLE STATES IMPOSSIBLE (to represent)! ***

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
badLineName (SpectralLineBad2 Fe Nothing) = "Iron I"
badLineName (SpectralLineBad2 Ca (Just CaII_849)) = "Calcium II 849"
badLineName (SpectralLineBad2 Ca (Just CaII_852)) = "Calcium II 852"
badLineName (SpectralLineBad2 Ca (Just CaII_866)) = "Calcium II 866"

-- Better: create an ADT that models the states exactly
data SpectralLine
  = HeliumI
  | HydrogenAlpha
  | IronI
  | CalciumII CaIILine

allLines :: [SpectralLine]
allLines =
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
element :: SpectralLine -> Element
element HeliumI = He
element HydrogenAlpha = H
element IronI = Fe
element (CalciumII _) = Ca

wavelength :: SpectralLine -> Nanometers
wavelength HeliumI = Nanometers 108.30
wavelength HydrogenAlpha = Nanometers 656.2
wavelength IronI = Nanometers 630.2
wavelength (CalciumII CaII_849) = Nanometers 849.8
wavelength (CalciumII CaII_852) = Nanometers 854.2
wavelength (CalciumII CaII_866) = Nanometers 866.2

-- Records: let you name fields
data SpatialPixel = SpatialPixel
  { x :: Int
  , y :: Int
  , luminosity :: Float
  }

data SpatialImage = SpatialImage
  { wavelength :: Nanometers
  , pixels :: [SpatialPixel]
  }

-- Use "." to access fields
findVerticalLine :: Int -> SpatialImage -> [Float]
findVerticalLine y img =
  map (.luminosity) $ filter (\px -> px.y == y) img.pixels

-- TODO: Exercise: Model an observation frame for the various instruments.
-- This model forces us to handle weird edge cases deep in our code!
-- Improve it as much as possible
data ObservationFrame = ObservationFrame
  { observationId :: String
  , proposalId :: String
  , dateTime :: String
  , instrument :: String
  , -- ViSP has 0 spatial images
    -- VBI has N spatial images
    -- Cryo has 1 spatial image
    spatialImages :: [SpatialImage]
  , -- ViSP has 3 spectral images
    -- Cryo has 1
    -- VBI has 0
    spectralImage1 :: Maybe SpectralImage
  , spectralImage2 :: Maybe SpectralImage
  , spectralImage3 :: Maybe SpectralImage
  }

-- TODO: define SpectralImage
data SpectralImage = SpectralImage

-- TODO: Fix me!
-- Why is this problematic?
-- If we model the data poorly we have to check for data issues every time we access them
-- And we keep having to deal with edge conditions everywhere!
processCryo :: [ObservationFrame] -> [String]
processCryo frames =
  let cfs = filter isCryo frames
      wls = map cryoSpatialWavelength cfs
   in map handleWavelength wls
 where
  isCryo f = f.instrument == "Cryo"

  handleWavelength :: Maybe Nanometers -> String
  handleWavelength Nothing = "ERROR, Cryo missing wavelength!"
  handleWavelength (Just (Nanometers wl)) = "Looks good: " ++ show wl

  cryoSpatialWavelength :: ObservationFrame -> Maybe Nanometers
  cryoSpatialWavelength frame =
    case frame.spatialImages of
      [img] -> Just img.wavelength
      -- TODO: what do we do if a cryo frame doesn't have an image?
      [] -> Nothing
      -- TODO: what do we do if a cryo frame has multiple images?
      imgs -> Nothing

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
-- DONE: Solution
-- (note) the ticks after names (like Instrument') are to avoid conflicts with definitions
-- you might write during your solution. This is common practice in haskell when you have a
-- variation on a type

newtype ObservationId' = ObservationId' String
newtype ProposalId' = ProposalId' String

data Instrument'
  = Cryo' SpatialImage SpectralImage
  | VBI' [SpatialImage]
  | ViSP' ViSPObservation -- It can be useful to have a record with named fields

data ViSPObservation = ViSPObservation
  { arm1 :: SpectralImage
  , arm2 :: SpectralImage
  , arm3 :: SpectralImage
  }

data ObservationFrame' = ObservationFrame'
  { observationId :: ObservationId'
  , proposalId :: ProposalId'
  , dateTime :: UTCTime
  , instrument :: Instrument'
  }

processAll :: [ObservationFrame'] -> [String]
processAll frames =
  map processFrame $ map (.instrument) frames
 where
  processFrame :: Instrument' -> String
  processFrame (Cryo' spatial spectral) = processCryo spatial spectral
  processFrame (VBI' imgs) = processVBI imgs
  processFrame (ViSP' visp) = processViSP visp

  processCryo :: SpatialImage -> SpectralImage -> String
  processCryo img _ = handleWavelength img.wavelength

  processVBI :: [SpatialImage] -> String
  processVBI _ = "processed VBI differently!"

  processViSP :: ViSPObservation -> String
  processViSP _ = "processed VISP differently!"

  handleWavelength :: Nanometers -> String
  handleWavelength (Nanometers wl) = "Looks good: " ++ show wl
