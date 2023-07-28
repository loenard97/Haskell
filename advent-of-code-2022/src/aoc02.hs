module Main where

-- read input file by lines
readFileLines :: FilePath -> IO [String]
readFileLines path = do
    contents <- readFile path
    return (lines contents)

-- split input line into two Char
splitToChars :: String -> Maybe (Char, Char)
splitToChars str = case words str of
        [char1, char2] -> Just (head char1, head char2)
        _              -> Nothing

-- convert input Char to scores
convertToScores :: Maybe (Char, Char) -> Int
convertToScores input_ = case input_ of
    Just ('A', 'X') -> 3 + 1
    Just ('B', 'X') -> 0 + 1
    Just ('C', 'X') -> 6 + 1
    Just ('A', 'Y') -> 6 + 2
    Just ('B', 'Y') -> 3 + 2
    Just ('C', 'Y') -> 0 + 2
    Just ('A', 'Z') -> 0 + 3
    Just ('B', 'Z') -> 6 + 3
    Just ('C', 'Z') -> 3 + 3
    _ -> -1

-- main
main :: IO ()
main = do
    let filePath = "data/02-rock_paper_scissors.txt"
    contents <- readFileLines filePath

    let results = sum (map (convertToScores . splitToChars) contents)
    putStrLn ("The total result is " ++ show results ++ ".")