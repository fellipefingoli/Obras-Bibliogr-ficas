require "rails_helper"
require "faker"
require "json"

RSpec.describe "Authors Create Bulk Request", :type => :request do
  let(:authors) do 
    [
      { name: 'José da Silva' },
      { name: 'Maria das Dores Neta' },
      { name: 'Francisco' },
    ] 
  end

  let(:response_parsed) { JSON.parse(response.body) }

  before { post(authors_create_bulk_path, params: { authors: authors }) }

  it { expect(response).to be_successful }

  it 'create authors' do
    expect(response_parsed.first["abnt_name"]).to eq('SILVA, José da')
    expect(response_parsed.second["abnt_name"]).to eq('DORES NETA, Maria das')
    expect(response_parsed.third["abnt_name"]).to eq('FRANCISCO')
  end
end
