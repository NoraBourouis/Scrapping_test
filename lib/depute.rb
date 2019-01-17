require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))

deputy_url = page.xpath('//*/tr/td[1]/a/@href')
name_deputy = page.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1')


urls = [] #créer un tableau qui récupére les urls des pages des députés
def get_deputy_urls(deputy_url, urls)
    deputy_url.each do |var|
    url = "https://www.nosdeputes.fr" +var
    urls << url
    end
    puts urls
end


tab_email= []

def get_deputy_email(urls,tab_email)
    urls.each do |var|
        page2 = Nokogiri::HTML(open("https://www.nosdeputes.fr" + var))
        emails = page2.xpath('//*/section[2]/div/table/tbody//tr[4]/td[2]')
        tab_email << emails.text
    end
    tab_email
end
get_deputy_email(urls,tab_email)

/rendu attendu : 
a = [
  { 
  	"first_name" => "Jean",
  	"last_name" => "Durant",
  	"email" => "jean.durant@assemblée.fr"
  },
  { 
  	"first_name" => "Martin",
  	"last_name" => "Dupont",
  	"email" => "martin.dupont@assemblée.fr"
  },
  etc
]/


