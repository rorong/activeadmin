require 'rails_helper'

RSpec.describe Product, type: :model do
  subject {
    FactoryGirl.create(:product)
  }

  it { is_expected.to have_many(:features) }

  describe "valid?" do
    context 'when name is present' do
      it { is_expected.to be_valid }
    end

    context 'when name is not present' do
      before { subject.name = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when carriers_limit is present' do
      it { is_expected.to be_valid }
    end

    context 'when carriers_limit is not present' do
      before { subject.carriers_limit = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when labels_limits is present' do
      it { is_expected.to be_valid }
    end

    context 'when labels_limits is not present' do
      before { subject.labels_limits = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when status is not present' do
      before { subject.status = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when status is active' do
      before { subject.status = 'active' }

      it { is_expected.to be_valid }
    end

    context 'when status is inactive' do
      before { subject.status = 'inactive' }
      
      it { is_expected.to be_valid }
    end
  end
end
