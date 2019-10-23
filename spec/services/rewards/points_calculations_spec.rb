require 'spec_helper'
RSpec.describe Rewards::PointsCalculations do
  describe ".perform(referral_id)" do

    let(:out_chain_user) { create(:user) }

    it 'returns update points of parents chain' do
      selected_referral_code = ''
      users_ids = []
      (5).times do
        user = FactoryBot.create(:user, referral_code: selected_referral_code)
        users_ids << user.id
        selected_referral_code = ReferralChain.find_by(user_id: user.id).referral_code
      end
      referral_id = User.last.id
      Rewards::PointsCalculations.perform(referral_id)
      expect(ReferralChain.find_by(user_id: users_ids[4]).points).to eq(1)
      expect(ReferralChain.find_by(user_id: users_ids[0]).points).to eq(1.9375)
    end

    it 'returns update points of parents chain' do
      out_chain_user
      selected_referral_code = ''
      users_ids = []
      (5).times do
        user = FactoryBot.create(:user, referral_code: selected_referral_code)
        users_ids << user.id
        selected_referral_code = ReferralChain.find_by(user_id: user.id).referral_code
      end
      referral_id = User.last.id
      Rewards::PointsCalculations.perform(referral_id)
      expect(ReferralChain.find_by(user_id: users_ids[4]).points).to eq(1)
      expect(ReferralChain.find_by(user_id: users_ids[0]).points).to eq(1.9375)
      expect(ReferralChain.find_by(user_id: out_chain_user.id ).points).to eq(0.0)
    end

  end

end