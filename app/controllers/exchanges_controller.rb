class ExchangesController < ApplicationController
  def index
  end

  def convert
    value = ExchangeService.new(params[:source_currency], params[:target_currency], params[:amount]).perform
    render json: {"value": value}
  end

  def convertcrypto
    value = CryptoService.new(params[:source_crypto], params[:target_crypto], params[:amount]).perform
    render json: {"value": value}
  end

  def crypto_box
    respond_to do |format|
      format.html {}
      format.js
    end
  end

  def coin_box
    respond_to do |format|
      format.html {}
      format.js
    end
  end

end
