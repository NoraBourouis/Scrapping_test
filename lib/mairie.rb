require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

city_url = page.xpath('//p/a/@href')
villes = page.xpath('//p/a')

#on cherche les noms des villes

villes.each do |ville|
    puts ville.text
end

townhall_url = ""

city_url.each do |url|
    puts url.text #ou n'importe quelle autre opération de ton choix ;)
    townhall_url = url.text
end

def get_townhall_email(townhall_url)
    emails = page.xpath('//*/td[2]')
    puts emails
end

get_townhall_email(townhall_url)