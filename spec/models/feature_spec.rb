require 'rails_helper'

RSpec.describe Feature, type: :model do
  let!(:product) { FactoryGirl.create(:product) }

  subject { FactoryGirl.create(:feature, product_id: product.id) }
  
  it { is_expected.to belong_to(:product) }

  describe "valid?" do
    context 'when product is present' do
      before { subject.product_id = product.id }

      it { is_expected.to be_valid }
    end

    context 'when product is not present' do
      before { subject.product_id = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when name is present' do
      it { is_expected.to be_valid }
    end

    context 'when name is not present' do
      before { subject.name = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when name is duplicate' do
      let(:feature) { Feature.create }
      before { subject.name = feature.name }

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