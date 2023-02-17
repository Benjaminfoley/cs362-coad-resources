FactoryBot.define do
  factory :region do
    name {'RegionName'}
    # id {1}
    sequence(:id) { |n| "#{n}" }
  end
end