require 'nokogiri'
require 'open-uri'
require 'rspec'
def cryptocurrencies

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


keys = page.xpath('//*/td[3]') 
values = page.xpath('//*/td[5]/a')

keyz = []
valeur = []

keys.each do |key|
  #puts key.text #ou n'importe quelle autre opération de ton choix ;)
  keyz << key.text
end

values.each do |value|
    #puts value.text
    valeur << value.text
end


crypto = Hash[keyz.zip(valeur.map)]
array_cryp = []


crypto.each { |k,v| v[0] = ""}
crypto.transform_values!(&:to_f)
crypto.each do |key, value|
    hash = Hash.new
        hash[key] = value
        array_cryp << hash
    end
return array_cryp
end

cryptocurrencies