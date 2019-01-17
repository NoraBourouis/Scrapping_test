require_relative '../lib/mairie.rb'

describe "La méthode get_townhall_urls récupère les urls des pages des villes" do
    it "trouver l'url des 185 communes du Val d'Oise" do
      expect(get_townhall_urls[1].size).to eq(185)
    end
  end
  
  describe "La méthode get_townhall_email cherche les emails des villes" do
    it "trouver l'email d'une ville du Val d'Oise" do
      expect(get_townhall_email("http://annuaire-des-mairies.com/95/amenucourt.html")).to eq("mairie.amenucourt@wanadoo.fr")
    end