FactoryBot.define do
  factory :user do
    user_name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    referral_code { Faker::Code.nric }

    trait :not_referred_user do
      before(:create) do |user|
        user.referral_code = nil
      end
    end

    factory :not_referred_user, traits: %i(not_referred_user)

  end
end