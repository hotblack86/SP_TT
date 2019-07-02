

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
      #@data << line.split(' ')
    end
    @data
  end

  def selector(log)
    @data[log]
  end

  def most_views
  end

end