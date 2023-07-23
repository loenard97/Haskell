factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

main :: IO ()
main = do
    putStrLn "Enter a number (or q to quit):"
    input <- getLine
    if input == "q"
        then return ()
        else do
            let num = read input :: Integer
            putStrLn ("Factorial of " ++ input ++ " is " ++ show (factorial num))
            main
