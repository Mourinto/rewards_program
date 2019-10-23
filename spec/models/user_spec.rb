require 'spec_helper'

RSpec.describe User, type: :model do
  describe "update_rewards_program" do
    let(:not_referred_user) { create(:not_referred_user) }
    let(:user) { create(:user, referral_code: ReferralChain.find_by(user_id: not_referred_user.id).referral_code) }

    it "insert in reward program table after creation " do
      not_referred_user
      expect(ReferralChain.find_by(user_id: user.id)).to be_truthy
      expect(ReferralChain.find_by(user_id: user.id).referral_code).to be_truthy
    end

    it "create new record in reward program table will change only it's oarent not other records" do
      user
      expect(ReferralChain.find_by(user_id: user.id)).to be_truthy
      expect(ReferralChain.find_by(user_id: user.id).referral_code).to be_truthy

    end

  end
end