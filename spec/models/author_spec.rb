require 'rails_helper'

RSpec.describe Author, :unit, type: :model do
  it 'can be instantiated' do
    expect(described_class.new).to be_a Author
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

  context 'associations' do
    it { is_expected.to have_and_belong_to_many(:books) }
  end
end
