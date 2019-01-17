require_relative '../lib/trader.rb'

describe "la méthode cryptocurrencies retrouve les keys et leurs values" do
    it "Le tableau doit contenir 2109 monnaies" do
      expect(crypto.size).to eq(2109)
    end
  end