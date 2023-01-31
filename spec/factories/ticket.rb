FactoryBot.define do
  factory :ticket do
    name {'TicketName'}
    phone {'1-888-888-8888'}
    organization_id {nil}
    region {nil}
    resource_category {nil}
  end
end