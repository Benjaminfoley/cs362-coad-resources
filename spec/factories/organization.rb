FactoryBot.define do
  factory :organization do
    name {"TestOrganization"}
    id {1}
    # sequence(:id) { |n| n }
    # sequence(:id) { |n| "#{n}" }
    # the following may or may not be necessary. 
    primary_name {"PrimaryName"}
    secondary_name {"SecondaryName"}
    phone {"111-111-1111"}
    secondary_phone {'1-222-222-22222'}
    email {"default@domain.com"}
  end

  trait :approved do 
    status { "approved" }
  end
end