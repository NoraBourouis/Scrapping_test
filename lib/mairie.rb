require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
page2 = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/"))

emails = page2.xpath("//*/section[2]/div/table/tbody/tr[4]/td[2]")
villes = page.xpath("//*/tr[2]/td/table/tbody/tr/td/p/a")

emails.each do |email|
    puts email.text #ou n'importe quelle autre opération de ton choix ;)
    
  end

 villes.each do |ville|
    puts ville.text #ou n'importe quelle autre opération de ton choix ;)
    
  end


def get_townhall_email(townhall_url)
end

def get_townhall_urls

end