class CreateReferralChainsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :referral_chains do |t|
      t.integer :user_id, uniq: true
      t.string :referral_code
      t.integer :referral_id
      t.float :points, default: 0
    end
  end
end

# INSERT INTO referral_chains(user_id, referral_id, chain_code)
# VALUES (1, 0, 4567),
#     (2,1, 234567),
#     (3,2, 9876),
#     (4,2, 567876),
#     (5,1, 9876765),
#     (6,5, 123456),
#     (7,5, 75432345),
#     (8,5, 0857346);