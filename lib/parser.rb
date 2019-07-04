# frozen_string_literal: true

require_relative 'log_sorter.rb'

# Parser class is used to parse a given file
# and display sorted data
class Parser
  include LogSorter

  attr_reader :data, :file

  def initialize(file_path)
    File.exists?(file_path) ? @file = File.open(file_path) : file_missing_error
    @data = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse
    @file.each do |line|
      uri, ip = line.split(/\s/)
      @data[uri] << ip
    end
  end

  def ordered_views
    @logs = most_views.sort_by { |_a, b| -b }
    displayer(unique: false)
  end

  def ordered_unique_views
    @logs = most_unique_views.sort_by { |_a, b| -b }
    displayer(unique: true)
  end

private

  def displayer(unique:)
    @logs.each.with_index(1) do |(page, count), index|
      unique ? text = "Unique Visits" : text = "Visits" 
      puts "| #{index} | #{page&.ljust(18)} | #{count} #{text}"
    end
  end

  def file_missing_error
    puts "Sorry, file not found. Please enter a valid filepath."
    exit
  end  

end
