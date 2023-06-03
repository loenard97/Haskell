-- binary tree
data Tree a = Node a (Tree a) (Tree a)
    | Empty
    deriving (Show)

-- guards
nodesAreSame (Node a _ _) (Node b _ _)
    | a == b        = True
    | otherwise     = False

main :: IO ()
main = do
    let i = 1
    let res = case i of
            1 -> "odd"
            2 -> "even"
            _ -> "unknown"
    putStrLn res

    let myTree = Node "parent" (Node "left" Empty Empty) (Node "right" Empty Empty)
    let res = nodesAreSame myTree myTree
    print (show res)
