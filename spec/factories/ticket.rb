FactoryBot.define do
  factory :ticket do
    name {'TicketName'}
    phone {'1-888-888-8888'}
    organization
    resource_category
    region 
    sequence(:id) { |n| "#{n}" }
  end
end