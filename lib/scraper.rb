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
      attributes = {}
      existing_attributes = []
      doc.css(".social-icon-containter a").each do |a|
          existing_attributes << "#{a.attribute("href").value}"
      end
      existing_attributes.each do |existing_attribute|
          if existing_attribute.include?("twitter")
              attributes[:twitter] = existing_attribute
          elsif existing_attribute.include?("linkedin")
              attributes[:linkedin] = existing_attribute
          elsif existing_attribute.include?("github")
              attributes[:gitbhub] = existing_attribute
          end
      end
      attributes
    #   attributes = {}
    #   doc.css(".social-icon-containter a").attribute("href")
    # #   attributes = []
    # #
    #   #
    # #   attributes
  end

end

# binding.pry
