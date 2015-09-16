#coloredcoind-wrapper-ruby (WIP)

###Disclaimer
This wrapper is still heavily WIP, so right now just getting asset metadata and address info, though asset issuing is half-way complete.

`issueAsset` returns an unsigned transaction object for now, though it will be changed to a signed one soon.

###What is this?
This is a coloredcoind wrapper built in Ruby, with the same capeabilities as the NodeJS one (still WIP), with some more utilities added to it.

##To-do list
- [x] getAssetMetadata
- [x] getAddressInfo
- [ ] getAssetHolders
- [x] issueAsset
- [ ] sendAsset
- [ ] broadcastTransaction
- [x] getAddress
- [ ] signTx

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

To get the address' info, use
```ruby
cc.getAddressInfo(<address>)
```

####getAddress
To use this method, you won't need any parameters at all.

To get your address, public key and private key out of this, use
```ruby
address = cc.getAddress()['address']
pubkey = cc.getAddress()['pubkey']
privkey = cc.getAddress()['privkey']
```

####issueAsset - WIP
To use this method, you'll need a metadata object with all of the required things, as described [here](http://coloredcoins.org/documentation/#IssueAsset), in the parameters section.

To issue the asset (with sample metadata), use
```ruby
metadata = {
  'issueAddress' => <address>,
  'amount' => 100,
  'divisibility' => 0,
  'fee' => 1000,
  'reissueable' => true,
  'transfer' => [{
    'address' => address,
    'amount' => 100
  }],
  'metadata' => {
    'assetId' => '1',
    'assetName' => 'Ruby Testy test wrapper',
    'issuer' => 'Asset Issuer',
    'description' => 'My Description',
    'userData' => {
      'meta'  => [
        { 'key' => 'Item ID', 'value' => 2, 'type' => 'Number' },
        { 'key' => 'Item Name', 'value' => 'Item Name', 'type' => 'String' },
        { 'key' => 'Company', 'value' => 'My Company', 'type' => 'String' },
        { 'key' => 'Address', 'value' => 'San Francisco, CA', 'type' => 'String' }
      ]
    }
  }
}
puts cc.issueAsset(metadata)
```