require_relative '../lib/deputy.rb'
describe "=la méthode get_deputy_urls, permet de recupérer les urls des pages des députés" do
  it "trouve l'url de chaque député : 577" do
    expect(get_deputy_urls[1].size).to eq(577)
  end
end

describe "La méthode permet de recuperer les mails sur leur profil" do
  it "trouver l'email d'un député" do
    expect(get_deputy_email("https://www.nosdeputes.fr/damien-abad")).to eq("contact@damien-abad.fr")
  end
end