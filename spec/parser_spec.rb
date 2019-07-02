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
  # it 'Returns all data from log file' do
  #   expect(web_parser.parse).to start_with(["/contact", "184.123.665.067"])
  #   expect(web_parser.data.length).to eq(499)
  # end

end