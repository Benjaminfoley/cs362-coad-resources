FactoryBot.define do
    factory :user do
      password { 'password' }

      # this creates a unique email each time the factory is called
      sequence(:email) { |n| "user_#{n}@email.com" }
      before(:create) { |user| user.skip_confirmation! }
    end

    trait :admin do 
      role { 'admin' }
    end

    trait :organization do 
      role { 'organization' }
    end
  end
