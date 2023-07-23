module Main where

import Data.List

-- convert string to int
toInt :: String -> Int
toInt "" = 0
toInt str = read str :: Int

-- split into blocks of data
splitBlocks :: [String] -> [[String]]
splitBlocks [] = []
splitBlocks xs = let (block, rest) = break null xs
                 in block : case rest of
                    [] -> []
                    (_:rest') -> splitBlocks rest'

-- compute sum of each block
sumBlocks :: [String] -> [Int]
sumBlocks = map (sum . map toInt) . splitBlocks

-- read input file
readFileLines :: FilePath -> IO [String]
readFileLines path = do
    contents <- readFile path
    return (lines contents)

main :: IO ()
main = do
    let filePath = "data-01.txt"
    contents <- readFileLines filePath
    let calories = sumBlocks contents

    putStrLn "List of calories:"
    mapM_ print calories

    let maxCalories = maximum calories
    let index = elemIndex maxCalories calories

    putStrLn ""
    case index of
        Just idx -> putStr ("Elf " ++ show (idx + 1) ++ " has " ++ show maxCalories ++ " calories.")
        Nothing -> putStr "Empty input."