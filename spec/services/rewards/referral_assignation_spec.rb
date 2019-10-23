require 'spec_helper'

RSpec.describe Rewards::ReferralAssignation do

  describe ".perform(user_id, referral_code = nil)" do
    let(:user) { create(:user) }
    let(:not_referred_user) { create(:user) }


    it 'assign not referred user to the reward program table and will not update any points' do
      user
      not_referred_user
      Rewards::ReferralAssignation.perform(not_referred_user.id)

      expect(ReferralChain.find_by(user_id: user.id).points).to eq(0.0)
      expect(ReferralChain.find_by(user_id: not_referred_user.id)).to be_truthy
      expect(ReferralChain.find_by(user_id: not_referred_user.id).referral_code).to be_truthy

    end

    it 'assign referred user to the reward program table and update points for referral chain' do
      referral_user = not_referred_user
      referral_code = ReferralChain.find_by(user_id: referral_user.id).referral_code
      new_referred_user_id = 100

      Rewards::ReferralAssignation.perform(new_referred_user_id, referral_code)

      expect(ReferralChain.find_by(user_id: referral_user.id).points).to eq(1)
      expect(ReferralChain.find_by(user_id: new_referred_user_id)).to be_truthy
      expect(ReferralChain.find_by(user_id: new_referred_user_id).referral_code).to be_truthy
    end
  end
end