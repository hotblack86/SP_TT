# frozen_string_literal: true

require 'capybara/rspec'
require 'parser.rb'

feature 'Page Views:' do
  let(:ordered_results) do
    [
      ['/about/2', 90],
      ['/contact', 89],
      ['/index', 82],
      ['/about', 81],
      ['/help_page/1', 80],
      ['/home', 78]
    ]
  end

  let(:ordered_unique_results) do
    [
      ['/help_page/1', 23],
      ['/contact', 23],
      ['/home', 23],
      ['/index', 23],
      ['/about/2', 22],
      ['/about', 21]
    ]
  end

  scenario 'Returns a list of webpages with most page views in descending order' do
    parser = Parser.new('webserver.log')
    parser.parse
    expect(parser.ordered_views).to eq(ordered_results)
  end

  scenario 'Returns a list of webpages with most unique page views in descending order' do
    parser = Parser.new('webserver.log')
    parser.parse
    expect(parser.ordered_unique_views).to eq(ordered_unique_results)
  end
end
