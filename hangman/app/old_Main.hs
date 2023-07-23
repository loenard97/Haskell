{-# LANGUAGE OverloadedStrings #-}

import System.IO
import Network.HTTP.Conduit (simpleHttp)
import Data.Char (toLower)
import Data.ByteString.Char8 (unpack)
import qualified Data.ByteString.Lazy.Char8 as L

inputLoop :: Int -> IO ()
inputLoop n
  | n <= 0 = return ()
  | otherwise = do
    putStrLn ("Enter a character (" ++ show n ++ " tries left):")
    hFlush stdout
    input <- getChar
    putStrLn ("You entered " ++ [input])
    inputLoop (n-1)

main :: IO ()
main = do
    -- response <- simpleHttp "https://random-word-api.herokuapp.com/word"
    let response = L.pack "[\"Hello World\"]"
    let trimmed = L.drop 2 (L.take (L.length response - 2) response)
    let length = fromIntegral (L.length trimmed)
    -- L.putStrLn trimmed
    -- print length
    putStrLn "Take a guess for the following word:"
    putStrLn (replicate length '_')
    guess <- getChar
    let isCorrectGuess = toLower guess `elem` L.unpack (L.map toLower trimmed)
    putStrLn (if isCorrectGuess then "Yep" else "Nope")

    inputLoop 5
