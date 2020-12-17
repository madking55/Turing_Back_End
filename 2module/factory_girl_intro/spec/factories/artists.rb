FactoryGirl.define do
  factory :artist do
    sequence(:name) { |n| "#{n} The Avett Brothers" }
  end
end