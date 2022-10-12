require 'rails_helper'

RSpec.describe Publisher, :unit, type: :model do
  it 'can be instantiated' do
    expect(described_class.new).to be_a Publisher
  end

  context 'has a valid factory' do
    let!(:author) { FactoryBot.create(:author) }

    it { expect(author).to be_persisted }
  end

  context 'validations' do
    let!(:author) { FactoryBot.create(:author) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
  end

  context 'validations' do
    it { is_expected.to have_many(:books) }
  end
end
