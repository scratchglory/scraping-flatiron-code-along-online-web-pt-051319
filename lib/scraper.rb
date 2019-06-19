require 'nokogiri'
require 'open-uri'
require 'pry'
require 'awesome_print'

require_relative './course.rb'

class Scraper
  
  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end
  
  def get_courses
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
    doc.css(".post")
  end
  
  def make_courses
    get_courses.each do |course|
      # binding.pry
      ap course
     new_course = Course.new()
     new_course.title = course.css("h2").text
     new_course.schedule = course.css("em").text
     new_course.description = course.css("p").text
    end
  end
  
    def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  

end



