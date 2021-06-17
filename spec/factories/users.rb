FactoryBot.define do
  factory :user do
    sequence(:user_name) { |i| "User#{i}" }
    sequence(:email) { |i| "email#{i}@example.com" }
    password { "password" }
    confirmed_at { Date.today }
  end
end
