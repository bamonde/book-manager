require 'rails_helper'

RSpec.describe String, :unit, type: :model do
  context '#present?' do
    it { expect(''.present?).to be_falsy }
    it { expect('any string'.present?).to be_truthy }
  end
end
