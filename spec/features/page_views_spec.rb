
require 'capybara/rspec'
require 'parser.rb'

feature 'Returns Page Views' do
  scenario 'Returns a list of webpages with most page views in descending order' do
      parser = Parser.new("webserver.log")
      expect(parser.ordered_most_views).to eq('/about/2 90 visits, /contact 89 visits, /index 82 visits, /about 81 visits, /help_page/1 80 visits, /home 78 visits')
  end  
end