require 'rails_helper'

RSpec.describe AdminUser, type: :model do

  subject { FactoryGirl.create(:admin_user) }

  describe '#valid?' do
    context 'when email is given valid email' do
      before { subject.email = 'test@user.com' }

      it { is_expected.to be_valid }
    end

    context 'when email is not present' do
      before { subject.email = nil }

      it { is_expected.not_to be_valid }
    end

    context 'when email is duplicated' do
      let(:user) { AdminUser.create }
      before { subject.email = user.email }

      it { is_expected.not_to be_valid }
    end
  end

  describe '#destroy' do
    let!(:user) { FactoryGirl.create(:admin_user) }
    it 'should destroy user' do
      expect { user.destroy }.to change(AdminUser, :count).by(-1)
    end
  end
end
