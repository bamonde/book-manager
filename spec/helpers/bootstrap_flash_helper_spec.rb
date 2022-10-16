require 'rails_helper'

RSpec.describe BootstrapFlashHelper, :unit, type: :helper do
  describe "#bootstrap_alert" do
    context 'receive alert' do
      it { expect(helper.bootstrap_alert('alert')).to eq('danger') }
    end

    context 'receive notice' do
      it { expect(helper.bootstrap_alert('notice')).to eq('success') }
    end
  end
end
