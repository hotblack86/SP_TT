require "parser.rb"

RSpec.describe Parser do

  subject { Parser.new("webserver.log") }
  let (:test_parse) { Parser.new("./spec/test_data.log") }

  describe '#parse' do
    let(:test_data) do
      {
        '/contact'   => ['184.123.665.067', '543.910.244.929'],
        '/index' => ['316.433.849.805'],
        '/home'   => ['316.433.849.805', '217.511.476.080'],
        '/help_page' => ['543.910.244.929'],
        '/about' => ['126.318.035.038', '016.464.657.359', '382.335.626.855']
      }
    end

    it 'should iterate over the file and push into empty data hash' do
      test_parse.parse
      expect(test_parse.data).to eq(test_data)
    end
  end
  

  describe '#most_views' do

    before { test_parse.parse }

      let(:most_viewed_results) do
      {
        '/about'   => 3,
        '/index' => 1,
        '/contact'    => 2,
        '/home'   => 2,
        '/help_page' => 1
      }
    end

    it 'Should group visits by different uri' do
      expect(test_parse.most_views).to eq(most_viewed_results)
    end
  end

end