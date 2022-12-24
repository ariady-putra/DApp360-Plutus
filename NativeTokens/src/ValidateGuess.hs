newtype HashedString = HS BuiltinByteString
  deriving newtype
    ( PlutusTx.ToData
    , PlutusTx.FromData
    , PlutusTx.UnsafeFromData
    )
PlutusTx.makeLift ''HashedString

newtype ClearString = CS BuiltinByteString
  deriving newtype
    ( PlutusTx.ToData
    , PlutusTx.FromData
    , PlutusTx.UnsafeFromData
    )
PlutusTx.makeLift ''ClearString

{-# INLINABLE validateGuess #-}
validateGuess :: HashedString -> ClearString -> PlutusV2.ScriptContext -> Bool
validateGuess hs cs _ = isGoodGuess hs cs

{-# INLINABLE isGoodGuess #-}
isGoodGuess :: HashedString -> ClearString -> Bool
isGoodGuess (HS secret) (CS guess') =
  secret == sha2_256 guess' 
