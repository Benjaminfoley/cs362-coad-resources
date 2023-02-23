FactoryBot.define do
  factory :ticket do
    name {'TicketName'}
    phone {'1-888-888-8888'}
    organization
    organization_id {1}
    resource_category
    region 
    # sequence(:id) { |n| "#{n}" }
    # sequence(:id) { |n| n }
    id {"1"}
  end
end