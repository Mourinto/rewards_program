module Rewards
  class ReferralAssignation

    def self.perform(user_id, referral_code = nil)
      referral_id = ReferralChain.find_by(referral_code: referral_code).try(:user_id)
      Rewards::PointsCalculations.perform(referral_id) if referral_id.present?
      ReferralChain.create(referral_code: Rewards::ReferralGenerator.secure_referral_code, user_id: user_id, referral_id: referral_id)
    end

  end

end