# frozen_string_literal: true

require_relative 'log_sorter.rb'

# Parser class is used to parse a given file
# and display sorted data
class Parser
  include LogSorter

  attr_reader :data

  def initialize(file_path)
    if File.exists?(file_path)
      @file = File.open(file_path)
    else
      puts "Sorry, #{file_path} can't be found."
      exit
    end
    
    @data = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse
    @file.each do |line|
      uri, ip = line.split(/\s/)
      @data[uri] << ip
    end
  end

  def ordered_views
    logs = most_views.sort_by { |_a, b| -b }
    table = logs.each.with_index(1) do |(page, count), index|
      puts "| #{index} | #{page&.ljust(18)} | #{count} Visits"
    end
    # table
  end

  def ordered_unique_views
    logs = most_unique_views.sort_by { |_a, b| -b }
    table = logs.each.with_index(1) do |(page, count), index|
      puts "| #{index} | #{page&.ljust(18)} | #{count} Unique Visits"
    end
    # table
  end
end
