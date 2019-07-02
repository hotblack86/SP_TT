

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

  def most_views
    @data.each_with_object({}) do |(key, value), list|
      list[key] = value.length
      end
  end

end