require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

city_url = page.xpath('//p/a/@href')
villes = page.xpath('//p/a')

#on cherche les noms des villes
tabville = [] #tableau avec les noms des villes
villes.each do |ville|
  # puts ville.text
  tabville << ville.text
end

townhall_url = []

city_url.each do |url|
    #puts url.text #ou n'importe quelle autre opération de ton choix ;)
    townhall_url << url.text
end

tab = []
def get_townhall_email(townhall_url,tab)
    townhall_url.each do |var|
        page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+var))
        emails = page2.xpath('//*/section[2]/div/table/tbody//tr[4]/td[2]')
        tab << emails.text
    end
    puts tab
end

get_townhall_email(townhall_url,tab)
