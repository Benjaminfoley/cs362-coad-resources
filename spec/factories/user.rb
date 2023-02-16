FactoryBot.define do
    factory :user do
      # name {"UserName"}
      # email
      password { 'password' }
      # password_confirmation { 'password' }

      # this creates a unique email each time the factory is called
      sequence(:email) { |n| "user_#{n}@email.com" }
      # before(:build_stubbed) { |user| user.skip_confirmation! }
      before(:create) { |user| user.skip_confirmation! }
    end

    trait :admin do 
      role { 'admin' }
    end

    trait :organization do 
      role { 'organization' }
    end
  end
