module Exercises.FITS where

-- import Data.Text

import Control.Applicative ((<|>))
import Data.Maybe (mapMaybe)
import Text.Read (readMaybe)

-- Parse Simplified FITS headers format:
--   Header
--     * Each key/value is 80 characters long
--     * Key is exactly 8 characters long
--     * followed by =
--     * Values can be 'strings' or numbers

-- break every 80 characters, an interesting recursive problem

fitsHeader :: String
fitsHeader =
  concat
    [ "WAVEMIN =    854.3138521265572                                                  "
    , "WAVEMAX =    856.8513736373629                                                  "
    , "NAXIS   =    3                                                                  "
    , "TELESCOP= 'Daniel K. Inouye Solar Telescope'                                    "
    , "OBSRVTRY= 'Haleakala High Altitude Observatory Site'                            "
    , "NETWORK = 'NSF-DKIST'                                                           "
    , "INSTRUME= 'VISP    '                                                            "
    ]

-- is it a parsing problem or a data modeling prolbme?
type Key = String
newtype Header = Header [(Key, Value)]
  deriving (Show)
data Value
  = Integer Integer
  | Float Float
  | String String
  deriving (Show)

parseHeader :: String -> Header
parseHeader inp =
  let rows = splitRows inp
      kvs = mapMaybe parseKeyValue rows
   in Header kvs

-- custom recursion?
splitRows :: String -> [String]
splitRows inp = go inp []
 where
  go "" rs = rs
  go inp rs =
    let (row, rest) = splitAt 80 inp
     in go rest (row : rs)

parseKeyValue :: String -> Maybe (Key, Value)
parseKeyValue row = do
  let (key, rest) = splitAt 8 row
  val <- parseValue rest
  return (key, val)

parseValue :: String -> Maybe Value
parseValue inp = do
  let inner = takeWhile (not . skip) $ dropWhile skip inp
  parseStringValue inner <|> parseIntValue inner <|> parseFloatValue inner
 where
  skip ' ' = True
  skip '=' = True
  skip _ = False

  parseStringValue ('\'' : rest) = do
    return $ String $ takeWhile (/= '\'') rest
  parseStringValue _ = Nothing

  parseIntValue inp = do
    n <- readMaybe inp
    return $ Integer n

  parseFloatValue inp = do
    n <- readMaybe inp
    return $ Float n

badData :: String
badData = "this is not a header"
