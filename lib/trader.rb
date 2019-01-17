require 'nokogiri'
require 'open-uri'


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

keys = page.xpath('//*/td[3]') 
values = page.xpath('//*/td[5]/a')

keyz = []
keys.each do |key|
  #puts key.text #ou n'importe quelle autre opération de ton choix ;)
  keyz << key.text
end

valeur = []
values.each do |value|
    #puts value.text
    valeur << value.text
end

crypto = Hash[keyz.zip(valeur.map)]

puts crypto

