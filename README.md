#coloredcoind-wrapper-ruby (WIP)

###Disclaimer
This wrapper is still heavily WIP, so right now just getting asset metadata and address info, though asset issuing is half-way complete.

###What is this?
This is a coloredcoind wrapper built in Ruby, with the same capeabilities as the NodeJS one (still WIP).

##To-do list
- [x] getAssetMetadata
- [x] getAddressInfo
- [ ] getAssetHolders
- [ ] issueAsset
- [ ] sendAsset
- [ ] broadcastTransaction

##Usage
There are 2 versions ColoredCoins - the mainnet one, and the testnet one. To use the mainnet version of it, use `:mainnet` in the initialization process. To use the testnet version of ColoredCoins, use `:testnet`.

To initialize, call
```ruby
cc = ColoredCoins.new(<network>)
```

####getAssetMetadata
To use the getAssetMetadata method, you will need 2 things:

1. The asset'ss assetId (obvioulsy)
2. A utxo that's related to the asset (can be found in the coloredcoins explorer page of the asset)

To get the asset's metadata, use
```ruby
cc.getAssetMetadata(<assetId>, <utxo>)
```

####getAddressInfo
To use this method, you'll need only the address that you want to get the info of.

To get the address', use
```ruby
cc.getAddressInfo(<address>)
```