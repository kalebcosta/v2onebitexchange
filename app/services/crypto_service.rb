require 'rest-client'
require 'json'

class CryptoService
  def initialize(source_crypto, target_crypto, amount)
    @source_crypto = source_crypto
    @target_crypto = target_crypto
    @amount = amount.to_f
  end

 
  def perform
    begin
      crypto_api_url = Rails.application.credentials[Rails.env.to_sym][:crypto_api_url]
      crypto_api_key = Rails.application.credentials[Rails.env.to_sym][:crypto_api_key]
      url = "#{crypto_api_url}/#{@source_crypto}/#{@target_crypto}"
      puts url
      res = RestClient.get url, {'X-CoinAPI-Key' => crypto_api_key}
      value = JSON.parse(res.body)["rate"] 
      value * @amount

    rescue RestClient::ExceptionWithResponse => e
      e.response
    end
  end
end