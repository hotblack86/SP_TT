require_relative "log_sorter.rb"

class Parser
  include LogSorter

  attr_reader :data

  def initialize(file_path)
    @file = File.open(file_path)
    @data = Hash.new { |hash, key| hash[key] = [] }
  end

  def parse
    @file.each do |line|
      uri, ip = line.split(/\s/)
      @data[uri] << ip
    end
  end

  def ordered_views
    logs = most_views().sort_by {|a,b| -b}
    logs.each.with_index(1) do |(page, count), index|
      puts "| #{index} | #{page&.ljust(18)} | #{count} Visits"
    end
  end

  def ordered_unique_views
    logs = most_unique_views().sort_by {|a,b| -b}
    logs.each.with_index(1) do |(page, count), index|
      puts "| #{index} | #{page&.ljust(18)} | #{count} Unique Visits"
    end
  end


  
  
  


end