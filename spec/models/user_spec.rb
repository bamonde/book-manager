require 'rails_helper'

RSpec.describe User, :unit, type: :model do
  it 'can be instantiated' do
    expect(described_class.new).to be_a User
  end

  context 'has a valid factory' do
    let!(:user) { FactoryBot.create(:user) }

    it { expect(user).to be_persisted }
  end

  context 'validations' do
    subject(:user) { FactoryBot.build(:user) }

    it { is_expected.to validate_presence_of(:name).on(:update) }
  end
end
