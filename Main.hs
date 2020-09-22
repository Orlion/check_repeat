module Main where

import Data.List.Split
import Data.List
import System.IO
import System.Environment

main = do
    args <- getArgs
    check args

check::[String] -> IO ()
check [filename] = do
    contents <- readFile filename
    mapM_ printRepeat $ fmap (\(x:xs) -> (x, 1 + length xs)) $ group $ splitOn "\r\n" contents
    putStrLn "check done"

check x = do
    putStrLn "请输入文件名"

printRepeat::(String, Int) -> IO()
printRepeat (word, num)
    | num > 1 = putStrLn $ word ++ " repeated " ++ (show num) ++ " times."
    | otherwise = return ()
