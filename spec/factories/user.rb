FactoryBot.define do
    factory :user do
        name {"user"}
        email {"default@domain.com"}
        password {"password"}
        password_confirmation {"password"}
        organization_id {1}
        role {nil}
        id {1}
    end
end
