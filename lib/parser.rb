

class Parser

  attr_reader :data

  def initialize(file_path)
    @file = File.open(file_path)
    @data = []
  end

  def parse
    @file.each do |line|
      @data << line.split(' ')
    end
    @data
  end

end