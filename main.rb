# frozen_string_literal: true

require_relative 'lib/parser'

parser = Parser.new(ARGV[0])
parser.parse
puts 'Total Visits'
parser.ordered_views
puts 'Total Unique Visits'
parser.ordered_unique_views
