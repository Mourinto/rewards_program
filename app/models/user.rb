class User < ActiveRecord::Base
  has_secure_password

  after_create_commit :update_rewards_program
  validates :user_name, uniqueness: { message: 'this user name is already taken' }
  validates :email, uniqueness: { message: 'this email is already exist' }

  # has_many :referral_chains, foreign_key: :user_id

  def update_rewards_program
    Rewards::ReferralAssignation.perform(id, referral_code)
  end

end