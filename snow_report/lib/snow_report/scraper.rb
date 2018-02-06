require 'pry'
require 'open-uri'
require 'nokogiri'
class SnowReport::Scraper
  def self.scrape_from_web(url)
    html = open(url)
    doc = Nokogiri::HTML(html)
    mountains = []
    table = doc.css(".resortList tr")
    table.each_with_index do |row, i|
      if i > 1 && i < table.size - 3
          # binding.pry
        mountain_hash = {
          :name => row.css(".name").text,
          :state => row.css(".rRegion").text.split(",")[0],
          :snowfall => row.css(".rLeft.b b")[1].text.chomp("\""),
          :base_depth => row.css(".rMid.c b").text.strip.split(" - ")[0].chomp("\""),
          :link => row.css(".rMid.c a").attribute("href").value, #(needs full web link)
          :runs_open => row.css("td.rMid")[3].text.strip.split("/")
        }
        mountains << mountain_hash
      end
    end
    mountains
  end


end
