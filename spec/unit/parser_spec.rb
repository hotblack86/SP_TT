require "parser.rb"

RSpec.describe Parser do

  let (:subject) { Parser.new("./spec/test_data.log") }
  before { subject.parse }

  describe '#parse' do
    let(:test_data) do
      {
        '/contact'   => ['184.123.665.067', '543.910.244.929'],
        '/index' => ['316.433.849.805'],
        '/home'   => ['217.511.476.080', '316.433.849.805', '217.511.476.080'],
        '/help_page' => ['543.910.244.929'],
        '/about' => ['126.318.035.038', '126.318.035.038', '016.464.657.359', '382.335.626.855' ]
      }
    end

    it 'Should iterate over the file and push into empty data hash' do
      expect(subject.data).to eq(test_data)
    end
  end
  
end