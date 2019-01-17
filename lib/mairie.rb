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
 #ajouter toutes les url dans un tableau
    city_url.each do |url|
        townhall_url << url.text #ajouter toutes les textes des urls dans le tableau
    end

tab = [] #créer un tableau qui recupère les mails
def get_townhall_email(townhall_url,tab)
    townhall_url.each do |var|
        page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/"+var))
        emails = page2.xpath('//*/section[2]/div/table/tbody//tr[4]/td[2]')
        tab << emails.text
    end
    puts tab
end

urls = [] #créer un tableau qui récupére les urls
def get_townhall_urls(townhall_url, urls)
    townhall_url.each do |var|
    url = "http://annuaire-des-mairies.com/" +var
    urls << url
    end
    puts urls
end

get_townhall_urls(townhall_url,urls)