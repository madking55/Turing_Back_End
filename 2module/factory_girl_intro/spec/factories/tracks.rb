FactoryGirl.define do
  factory :track do
    sequence(:name) { |n| "#{n} Big Poppa" }
    genre
    album
    media_type 
    milliseconds 10
  end
end