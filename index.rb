require 'net/http'
require 'unirest'
require 'yaml'
require 'bitcoin'
require 'json'

class ColoredCoins
  def initialize(network)
    bitcoin_networks = { :testnet => 'http://testnet.api.coloredcoins.org:80/v2/', :mainnet => 'http://api.coloredcoins.org:80/v2/' }
    if network != :testnet && network != :mainnet
      raise BitcoinNetworkError, 'Bitcoin network is only testnet or mainnet'
    else
      if network == :testnet
        Bitcoin.network = :testnet3
      else
        Bitcoin.network = :bitcoin
      end
      @apiUrl = bitcoin_networks[network]
      @headers = { 'Content-Type' => 'application/json' }
    end
  end
  def issueAsset(metadata)
    issueUrl = @apiUrl + 'issue'
    response = Unirest.post(issueUrl, headers: @headers, parameters: JSON.generate(metadata))
    body = response.body
    parser = Bitcoin::Protocol::Parser.new()
    tx = parser.process_pkt('tx', [body['txHex']].pack('H*'))[1]
    return body
  end
  def getAddress()
    File.open("./config.yml", "r+") { |file| 
      c = file.read()
      y = YAML.load(c)
      if y['pubkey'] == nil and y['privkey'] == nil and y['address'] == nil
        key = Bitcoin::generate_key
        address = Bitcoin::pubkey_to_address(key[1])
        y2 = { 'pubkey' => key[1], 'privkey' => key[0], 'address' => address }
        File.delete(file)
        File.open("./config.yml", "w+") { |f2| 
          f2.write y2.to_yaml
          return y2
        }
      else
        return y
      end
    }
  end
  def getAssetMetadata(assetId, utxo)
    getAssetMetadataUrl = @apiUrl + 'assetmetadata/' + assetId + '/' + utxo
    response = Unirest.get(getAssetMetadataUrl)
    body = response.body
    return body
  end
  def getAddressInfo(address)
    getAddressInfoUrl = @apiUrl + 'addressinfo/' + address
    response = Unirest.get(getAddressInfoUrl)
    body = response.body
    return body
  end
end