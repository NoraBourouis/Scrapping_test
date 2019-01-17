require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("https://www.nosdeputes.fr/deputes"))

deputy_url = page.xpath('//*/tr/td[1]/a/@href')
name_deputy = page.xpath('//*[@id="corps_page"]/div/div[1]/div[1]/h1')


urls_toget = [] #créer un tableau qui récupére les urls des pages des députés
def get_deputy_urls(deputy_url, urls_toget)
    deputy_url.each do |var|
    url = "https://www.nosdeputes.fr" +var
    urls_toget << url
    end
 urls_toget
end
get_deputy_urls(deputy_url, urls_toget)

tab_email= []
def get_deputy_email(urls_toget,tab_email)
    urls_toget.each do |var|
        page2 = Nokogiri::HTML(open(var))
        emails = page2.xpath('//div[1]/div[5]/div/div[2]/div[1]/ul[2]/li[1]/ul/li[1]/a')
        tab_email << emails.text
    end
    puts tab_email
end

get_deputy_email(urls_toget,tab_email)


