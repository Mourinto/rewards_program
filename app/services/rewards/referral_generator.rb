require 'securerandom'
module Rewards
  class ReferralGenerator
    def self.secure_referral_code
      rand(36 ** 8).to_s(36)
    end
  end
end