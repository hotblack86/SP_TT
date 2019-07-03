# frozen_string_literal: true

require 'parser.rb'
require 'log_sorter.rb'

RSpec.describe LogSorter do
  let (:subject) { Parser.new('./spec/test_data.log') }
  before { subject.parse }

  describe '#most_views' do
    let(:most_viewed_results) do
      {
        '/about' => 4,
        '/home' => 3,
        '/contact' => 2,
        '/index' => 1,
        '/help_page' => 1
      }
    end

    it 'Should group visits by different uri' do
      expect(subject.most_views).to eq(most_viewed_results)
    end
  end

  describe '#most_unique_views' do
    let(:most_viewed_unique_results) do
      {
        '/about' => 3,
        '/contact' => 2,
        '/home' => 2,
        '/help_page' => 1,
        '/index' => 1
      }
    end

    it 'Should group unique visits by different uri' do
      expect(subject.most_unique_views).to eq(most_viewed_unique_results)
    end
  end
end
