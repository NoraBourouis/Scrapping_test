require_relative '../lib/trader.rb'

describe "la méthode cryptocurrencies retrouve les keys et leurs values" do
    it "Le tableau contient au moins une monnaie,et de ne pas être nul" do
        expect(cryptocurrencies.class).not_to be_nil 
    end
    it "les données doivent être récupérées dans un array " do
        expect(cryptocurrencies.class).to eq(Array) 
    end
end