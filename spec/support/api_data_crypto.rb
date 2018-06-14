RSpec.configure do |config|
  config.before(:each) do   
    stub_request(:get, /rest.coinapi.io/ )
    .with(headers: {
      'Accept'=>'*/*',
      'X-CoinAPI-Key' => Rails.application.credentials[Rails.env.to_sym][:crypto_api_key]
    }).to_return(status: 200, body: '
      {
        "time": "2017-08-09T14:31:37.0520000Z",
        "asset_id_quote": "USD",
        "rate": 3258.8875417798037784035133948
      }', headers: {})
  end
end