import System.IO (hFlush, stdout)
import Data.Char (toLower)

data GameState = GameState
  { currentGuess :: String
  , previousGuesses :: [Char]
  , guessesLeft :: Int
  }

printGameState :: GameState -> IO ()
printGameState(GameState currentGuess previousGuesses guessesLeft) = 
    putStr (show currentGuess)
    putStrLn "Guesses left: " ++ show guessesLeft

getGuess :: IO Char
getGuess = do
    putStr "Take a guess: "
    hFlush stdout
    guess <- getLine
    case guess of
        [c] | c `elem` ['a'..'z'] -> return c
        [c] | c `elem` ['A'..'Z'] -> return (toLower c)
        _ -> putStrLn "Not a valid input. Try again." >> getGuess 

--gameLoop :: GameState -> IO ()


main :: IO()
main = do
    let word = "haskell"
    let maxGuesses = 10
    let initialGameState = GameState "haskell" [] maxGuesses
    printGameState initialGameState
