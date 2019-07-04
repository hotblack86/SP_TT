# frozen_string_literal: true

require_relative 'lib/parser'

filename = ARGV[0]

if filename.nil?
  puts "\n"
  puts 'Error: Please enter a path to the log file you wish to use'
  puts "\n"
else
  parser = Parser.new(ARGV[0])
end

parser.parse
puts "\n"
puts 'Total Visits'
parser.ordered_views
puts "\n"
puts 'Total Unique Visits'
parser.ordered_unique_views
puts "\n"
