FactoryBot.define do
  factory :organization do
    name {"Region"}
    status {nil}
    phone {111-111-1111}
    email {"default@domain.com"}
    description {"Description"}
    id {1}
  end
end