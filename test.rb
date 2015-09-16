cc = ColoredCoins.new(:testnet)
address = cc.getAddress()['address']
metadata = {
  'issueAddress' => address,
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

puts cc.getAssetMetadata('LK5cJLW2fjZQS9gi4VSvvMsqPwRvvk4KD5mCU', 'ddb5e36f63ab0787cf441053baadb84735831f8a6e425e3e9e0f2d3d50309b4e:1')
puts cc.getAddressInfo('n1Kf9tSxasybAcckMNzanzut36vKK1xJ9c')

