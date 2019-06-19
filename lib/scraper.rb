require 'nokogiri'
require 'open-uri'
require 'pry'
require 'awesomeprint'

require_relative './course.rb'

class Scraper
  
  def get_page
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
  end
  
  def get_courses
    html = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    doc = Nokogiri::HTML(html)
    doc.css(".posts-holder")
  end
  
  def make_courses
    get_courses.each do |course|
      # binding.pry
      ap course
     new_course = Course.new()
     new_course.title
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



