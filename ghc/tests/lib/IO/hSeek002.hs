-- !!! Testing EOF (and the clearing of it)
module Main(main) where

import IO
import Directory ( removeFile )
#if defined(__MINGW32__)
import PrelHandle(hSetBinaryMode)
#endif

main :: IO ()
main = do
   hdl <- openFile "hSeek002.hs" ReadMode
#  if defined(__MINGW32__)
   hSetBinaryMode hdl True
#  endif
   flg <- hIsEOF hdl
   print flg
   hSeek hdl SeekFromEnd 0
   flg <- hIsEOF hdl
   print flg
   hSeek hdl SeekFromEnd (-1)
   flg <- hIsEOF hdl
   print flg
   hGetChar hdl
   flg <- hIsEOF hdl
   print flg
   hSeek hdl SeekFromEnd (-1)
   flg <- hIsEOF hdl
   print flg
   hClose hdl
