import Text.ParserCombinators.ReadP

isVowel :: Char -> Bool
isVowel char = 
    any (char ==) "aouei"

vowel :: ReadP Char
vowel =
    satisfy isVowel

main :: IO ()
main = do
    contents <- readFile "input.txt"
    let result = readP_to_S vowel "aeiou"
    print result