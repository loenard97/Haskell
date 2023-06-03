type BookTitle = String

data BookStatus = InLibrary
    | Missing
    deriving (Show)

data Book = Book Int BookTitle [String] BookStatus
    deriving (Show)

-- automatic accessor
data Customer = Customer
    { customerId        :: Int
    , customerName      :: String
    , customerAddress   :: String
    } deriving (Show)

-- binary tree
data Tree a = Node a (Tree a) (Tree a)
    | Empty
    deriving (Show)

main :: IO ()
main = do
    putStrLn "Hello World"

    let myBook = Book 123 "Title" ["Author 1", "Author 2"] InLibrary
    print myBook

    let myCustomer = Customer 5 "Pete" "New York"
    print myCustomer
    print (customerId myCustomer)

    let myTree = Node "root" (Node "left" Empty Empty) (Node "right" Empty Empty)
    print myTree
