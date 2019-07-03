# frozen_string_literal: true

require_relative 'lib/parser'

parser = Parser.new(ARGV[0])
parser.parse
puts "\n"
puts 'Total Visits'
parser.ordered_views
puts "\n"
puts 'Total Unique Visits'
parser.ordered_unique_views
puts "\n"
