import System.IO (hFlush, stdout)
import Data.Char (toLower)

wordToGuess :: String
wordToGuess = "haskell"

maxGuesses :: Int
maxGuesses = 6

data GameState = GameState
  { word :: String
  , guesses :: [Char]
  }

initialGameState :: GameState
initialGameState = GameState wordToGuess []

-- game logic
showState :: GameState -> String
showState (GameState word guesses) = 
    "Word: " ++ [if c `elem` guesses then c else '_' | c <- word] ++
    "\nGuesses: " ++ guesses ++
    "\nGuesses left: " ++ show (maxGuesses - length wrongGuesses)
    where wrongGuesses = filter (`notElem` word) guesses

-- get user input
getGuess :: IO Char
getGuess = do
    putStr "Enter a guess: "
    hFlush stdout
    guess <- getLine
    case guess of
        [c] | c `elem` ['a'..'z'] -> return (toLower c)
        _ -> putStrLn "Invalid guess. Please enter a single lowercase letter." >> getGuess

-- main game loop
gameLoop :: GameState -> IO ()
gameLoop state@(GameState word guesses)
  | length wrongGuesses >= maxGuesses = putStrLn ("You lose! The word was " ++ word)
  | all (`elem` guesses) word = putStrLn ("You win! The word was " ++ word)
  | otherwise = do
    putStrLn (showState state)
    guess <- getGuess
    if guess `elem` guesses
        then putStrLn "You already guessed that letter, try again." >> gameLoop state
        else gameLoop (GameState word (guess:guesses))
  where wrongGuesses = filter (`notElem` word) guesses

-- main function
main :: IO ()
main = gameLoop initialGameState
