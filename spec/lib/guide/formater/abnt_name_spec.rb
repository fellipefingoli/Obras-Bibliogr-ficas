require 'rails_helper'
require './lib/guide/formater/abnt_name.rb'

RSpec.describe Guide::Formater::AbntName, type: :lib do
  describe '.call' do
    let(:name1) { 'José Silva' }
    let(:name2) { 'José da Silva' }
    let(:name3) { 'José da Silva Filho' }
    let(:name4) { 'José Filho' }
    let(:name5) { 'José' }
    let(:name6) { 'José Filho da Silva' }
    let(:name7) { 'Maria das Dores Neta' }

    it { expect(described_class.(name1)).to eq('SILVA, José') }

    it { expect(described_class.(name2)).to eq('SILVA, José da') }

    it { expect(described_class.(name3)).to eq('SILVA FILHO, José da') }

    it { expect(described_class.(name4)).to eq('FILHO, José') }

    it { expect(described_class.(name5)).to eq('JOSÉ') }

    it { expect(described_class.(name6)).to eq('SILVA, José Filho da') }

    it { expect(described_class.(name7)).to eq('DORES NETA, Maria das') }
  end
end