require "parser.rb"

RSpec.describe Parser do

  let(:web_parser) { Parser.new("webserver.log") }

  it 'Returns all data from log file' do
    expect(web_parser.parse).to start_with(["/contact", "184.123.665.067"])
    expect(web_parser.data.length).to eq(499)
  end

end