require 'rails_helper'

RSpec.describe Author, type: :model do
  let(:author) { create(:author, first_name: 'José', last_name: 'da Silva') }
  
  it 'build abnt_name' do
    expect(author.abnt_name).to eq('SILVA, José da')
  end
end
