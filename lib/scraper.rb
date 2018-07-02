require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
      html = open(index_url)
      doc = Nokogiri::HTML(html)
      students = []
      doc.css(".student-card").each do |student|
          students << {name: student.css(".student-name").text,
          location: student.css(".student-location").text,
          profile_url: student.css("a").attribute("href").value
      }
      end
      students
  end

  def self.scrape_profile_page(profile_url)
      html = open(profile_url)
      doc = Nokogiri::HTML(html)
      attributs = [{
          twi
      }
      ]
    #   attributes = []
    #
      #
    #   attributes
  end

end

binding.pry
