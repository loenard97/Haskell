type BookTitle = String

data BookStatus = InLibrary
                | Missing
                deriving (Show)

data Book = Book Int BookTitle [String] BookStatus
    deriving (Show)

main :: IO ()
main = do
    putStrLn "Hello World"
    let myBook = Book 123 "Title" ["Author 1", "Author 2"] InLibrary
    print myBook
