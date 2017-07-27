FactoryGirl.define do
  factory :user do
    sequence(:email) { |i| "user_#{i}@localhost.localdomain" }
    password 'password'
    password_confirmation 'password'
  end
end
