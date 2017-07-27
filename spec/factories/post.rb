FactoryGirl.define do
  factory :post do
    association :creator, factory: :user
  end
end
