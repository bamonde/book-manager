require 'rails_helper'

RSpec.describe Book, :unit, type: :model do
  it 'can be instantiated' do
    expect(described_class.new).to be_a Book
  end

  context 'has a valid factory' do
    let!(:book) { FactoryBot.create(:book) }

    it { expect(book).to be_persisted }
  end

  context 'validations' do
    let!(:book) { FactoryBot.create(:book) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:genre) }
    it { is_expected.to validate_presence_of(:release_date) }
    it { is_expected.to validate_presence_of(:edition) }
    it { is_expected.to validate_presence_of(:publisher) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:publisher) }
    it { is_expected.to have_and_belong_to_many(:authors).dependent(:destroy) }
    it { is_expected.to have_one(:cover_attachment) }
  end
end
