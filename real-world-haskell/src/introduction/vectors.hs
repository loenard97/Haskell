data Vec3D = Vec3D Double Double Double
             deriving (Show, Eq)

main :: IO ()
main = do
    let vec1 = Vec3D 1.0 2.0 3.0
    let vec2 = Vec3D 3.0 2.0 1.0
    print vec1
    print (vec1 == vec2)
