FactoryGirl.define do
  factory :album do
    sequence(:title) { |i| "#{i} Mignonette" }
    artist
  end
end