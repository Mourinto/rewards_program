require 'spec_helper'

RSpec.describe ReferralChain, type: :model do

  describe ".check_referral_code(referral_code)" do

    it 'return true if there is a record with this referral code' do
      ReferralChain.create(user_id: 1, referral_code: 'testcode')
      expect(ReferralChain.check_referral_code('testcode')).to be_truthy
    end

    it 'return false if there is no a record with this referral code' do
      ReferralChain.create(user_id: 1, referral_code: 'testcode')
      expect(ReferralChain.check_referral_code('test---code')).to be_falsy
    end

  end

  describe ".generate_referral_url(user_id)" do
    let(:user) { create(:user) }

    it 'return url with referral code relates to specific user' do
      user
      code = ReferralChain.find_by(user_id: user.id).referral_code
      expect(ReferralChain.generate_referral_url(user.id)).to eq("localhost:9292/sign_up/#{code}")
    end

  end

end