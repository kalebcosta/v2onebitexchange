Rails.application.routes.draw do
  root 'exchanges#index'
  get 'convert', to: 'exchanges#convert'
  get 'convertcrypto', to: 'exchanges#convertcrypto'
  get 'crypto_box', to: 'exchanges#crypto_box'
  get 'coin_box', to: 'exchanges#coin_box'
end
