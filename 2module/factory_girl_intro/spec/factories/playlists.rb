FactoryGirl.define do
  factory :playlist do
    sequence(:name) { |n| "#{n} Jamz" }
  end
end