# Example NFT Marketplace Dapp

## Actions Outline

List NFT
Buy NFT (Taker and Marker)
UpdatePrice NFT
CancelListing NFT  

Borrow NFT
Lend NFT
PayBack NFT
ClawBack NFT

## Scripts Outline

Sell Script 

( MadeLoan Script -> Lend Script )
MadeLoan Script 

## Transaction Outline

### Tx 1 (List NFT)

In:
User1 (ADA + NFT)

Out:
Sell Script [ owner: Address, recipient: Address, price: Value ] (NFT)

### Tx 2 (Buy NFT [Taker]) 

In:
User2 (X ADA)
ref1 @ Sell Script [ ...recipient: Address ] (NFT)

Out:
User2 (NFT + NFT2 )
recipient [ ref1 ] (X ADA)

### Tx 3 (Lend NFT)

In:
User3 (ADA + NFT)

Out:
Lend Script [ owner: Address, borrower: Address, collateral: Value, interest: Value, duration: Interger, nft: CurrencySymbol ] (NFT)

### Tx 4 (Borrow NFT)

In:
Lend Sript [ ... ] (NFT)
User4 (X ADA)

Out:
User4 (NFT)
MadeLoan Script [ ...borrower=User4,  ]

## Logic Outline

### Sell Script 

Datum:
owner: Address
recipient: Address
price: Value

Redeemer:
Buy NFT

Buy NFT: 
= recipient gets price ( datum = utxoRef of self )

### Lend Script 

Datum:
owner: Address
collateral: Value
interest: Value
duration: Interger
nft: CurrencySymbol

Redeemer:
Cancel
Borrow
Update

### MadeLoan Script 

Datum:
owner: Address
borrower: Address 
interest: Value
start: Integer
duration: Interger
nft: CurrencySymbol

Redeemer:
PayBack
ClawBack

## Potential Vulnerabilities

Buy NFT Double Satisfaction (+)