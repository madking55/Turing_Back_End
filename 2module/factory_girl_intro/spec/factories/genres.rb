FactoryGirl.define do
  factory :genre do
    sequence(:name) { |n| "#{n} R&B" }
  end
end