FactoryGirl.define do
  factory :media_type do
    sequence(:name) { |n| "#{n} LazerDisk" }
  end
end