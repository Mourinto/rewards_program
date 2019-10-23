class ReferralChain < ActiveRecord::Base
  has_many :users

  def self.check_referral_code(referral_code)
    ReferralChain.find_by(referral_code: referral_code)
  end

  def self.generate_referral_url(user_id)
    code = ReferralChain.find_by(user_id: user_id).referral_code
    "localhost:9292/sign_up/#{code}"
  end

  def self.user_points(users_ids)
    users_ids.map do |user_id|
      ReferralChain.find(user_id: user_id).try(:points)
    end
  end

end