

class Parser

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
      puts "| #{index} | #{page&.ljust(18)} | #{count} visits"
    end
  end

  def ordered_unique_views
    logs = most_unique_views().sort_by {|a,b| -b}
    logs.each.with_index(1) do |(page, count), index|
      puts "| #{index} | #{page&.ljust(18)} | #{count} visits"
    end
  end

  def most_views
    view_counter(is_unique: false).sort_by {|a,b| -b}.to_h
  end

  def most_unique_views
    view_counter(is_unique: true).sort_by {|a,b| -b}.to_h
  end

  def view_counter(is_unique:)
    @data.each_with_object({}) do |(key, value), list|
      list[key] = is_unique ? value.uniq.length : value.length
    end
  end 


end