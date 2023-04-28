factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial(n - 1)

fibonacci :: Int -> Int
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = n + fibonacci(n - 1) + fibonacci(n - 2)

-- sumList recursive with strict (+)
sumListStrict :: [Int] -> Int
sumListStrict (x:xs) = x + sumListStrict xs
sumListStrict [] = 0

-- sumList with foldr
sumListFoldr :: [Int] -> Int
sumListFoldr = foldr (+) 0

main :: IO ()
main = do
    print ("5! = " ++ show (factorial 5))
    print ("fib(5) = " ++ show (fibonacci 5))
    let myList = [1..10]
    print ("Sum of [1..10] = " ++ show (sumListFoldr myList))
