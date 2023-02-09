FactoryBot.define do
  factory :ticket do
    name {'TicketName'}
    phone {'1-888-888-8888'}
    organization_id {1}
    # region {'RegionName'}
    # resource_category {'ResourceCategoryName'}
    # created_at {Date.today}
    # updated_at {Date.today}
    # closed {false}
    # closed_at {nil}
    # region_id {nil}
    # resource_category_id {nil}
  end
end